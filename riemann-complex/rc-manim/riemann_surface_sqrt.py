from manim import *
import numpy as np

def wrap_angle(angle, low, high):
    width = high - low
    return ((angle - low) % width) + low

def principal_root(z):
    return np.sqrt(abs(z)) * np.exp(0.5j * np.angle(z))

def sheet_color(sheet):
    return BLUE_E if sheet == 0 else GREEN_E

class RiemannSurfaceSquareRoot(ThreeDScene):
    plane_radius = 2.0
    surface_radius = 2.55
    r_min = 0.03
    sheet_height = 1.25
    theta_eps = 0.08

    def plane_point(self, axes, z):
        return axes.c2p(z.real, z.imag, 0)

    def sheet_xyz(self, radius, plane_angle, sheet):
        # Map the same physical z-angle to each chart interval.
        if sheet == 0:
            chart_angle = wrap_angle(plane_angle, -PI, PI)
        else:
            chart_angle = wrap_angle(plane_angle, PI, 3 * PI)

        x = radius * np.cos(plane_angle)
        y = radius * np.sin(plane_angle)

        t = radius / self.surface_radius
        base_height = self.sheet_height * (1 - np.exp(-2.6 * t))
        warp = 0.22 * t * np.sin(1.45 * chart_angle + 1.8 * t)

        z = (1 if sheet == 0 else -1) * base_height + warp
        return np.array([x, y, z])

    def lifted_point(self, progress, radius):
        # One loop in z: theta in [0, 2π). Cross sheets along the cut seam.
        angle = TAU * progress
        gap = 0.18
        if angle <= PI - gap:
            return self.sheet_xyz(radius, angle, 0)
        if angle >= PI + gap:
            return self.sheet_xyz(radius, angle, 1)

        # Blend across the identified cut boundary for a continuous lift.
        t = (angle - (PI - gap)) / (2 * gap)
        top_edge = self.sheet_xyz(radius, PI - self.theta_eps, 0)
        bottom_edge = self.sheet_xyz(radius, PI + self.theta_eps, 1)
        return interpolate(top_edge, bottom_edge, t)

    def construct(self):
        self.set_camera_orientation(phi=0 * DEGREES, theta=-90 * DEGREES)
        self.camera.background_color = BLACK

        # 1) Intro title
        title = Title(r"Riemann Surface for $y=\sqrt{z}$", color=WHITE)
        subtitle = MathTex(r"y=\sqrt{z}", color=WHITE).scale(0.58)
        title.to_edge(UP, buff=0.28)
        subtitle.next_to(title, DOWN, buff=0.1)
        self.play(Write(title), Write(subtitle), run_time=1.3)
        self.wait(0.4)

        # 2) Two-valued map on the punctured plane + branch cut
        plane_size = 3.85
        plane_y = 2.10
        z_plane = Axes(
            x_range=[-3, 3, 1],
            y_range=[-3, 3, 1],
            x_length=plane_size,
            y_length=plane_size,
            axis_config={"color": WHITE, "include_tip": True},
        ).move_to(LEFT * 2.95 + UP * plane_y)
        w_plane = Axes(
            x_range=[-3, 3, 1],
            y_range=[-3, 3, 1],
            x_length=plane_size,
            y_length=plane_size,
            axis_config={"color": WHITE, "include_tip": True},
        ).move_to(RIGHT * 2.95 + UP * plane_y)

        z_axis_labels = z_plane.get_axis_labels(
            x_label=MathTex(r"\Re(z)", color=WHITE),
            y_label=MathTex(r"\Im(z)", color=WHITE),
        )
        w_axis_labels = w_plane.get_axis_labels(
            x_label=MathTex(r"\Re(w)", color=WHITE),
            y_label=MathTex(r"\Im(w)", color=WHITE),
        )

        z_heading = Text("z-plane", font_size=28, color=WHITE).next_to(z_plane, UP, buff=0.1)
        w_heading = Text("w-plane", font_size=28, color=WHITE).next_to(w_plane, UP, buff=0.1)

        branch_point = Dot(self.plane_point(z_plane, 0 + 0j), color=RED, radius=0.05)
        branch_label = MathTex(r"0,\ \text{branch point}", color=RED).next_to(
            branch_point, RIGHT, buff=0.15
        )

        cut_path = DashedLine(
            self.plane_point(z_plane, (-self.plane_radius + 0.01) + 0j),
            self.plane_point(z_plane, 0j),
            color=RED_B,
            stroke_width=4,
        )
        cut_text = MathTex(r"\text{Branch cut}", color=RED_B).scale(0.55).next_to(
            cut_path, DOWN, buff=0.18
        )

        loop_path = ParametricFunction(
            lambda t: self.plane_point(
                z_plane, self.plane_radius * np.exp(1j * TAU * t)
            ),
            t_range=[0, 1],
            stroke_color=GREY_C,
        )
        loop_path.set_stroke(width=2.2, opacity=0.8)

        values_formula = MathTex(
            r"\sqrt{z} = \pm \sqrt{r}\,e^{i\theta/2},\quad"
            r"\theta\in(-\pi,\pi)\ \text{(principal chart)}"
        ).scale(0.54).set_color(BLUE_E)
        two_value_note = Text("Two values", font_size=28, color=BLUE_D)
        flat_value_block = VGroup(values_formula, two_value_note).arrange(
            DOWN, aligned_edge=LEFT, buff=0.1
        )
        flat_value_block.next_to(z_plane, DOWN, buff=0.18)

        # 3) Animated loop + two branches in the plane
        loop_tracker = ValueTracker(0)

        z_moving = Dot(color=ORANGE, radius=0.06)
        def z_complex():
            return self.plane_radius * np.exp(1j * TAU * loop_tracker.get_value())

        z_moving.add_updater(
            lambda m: m.move_to(self.plane_point(z_plane, z_complex()))
        )

        w_plus = Dot(color=BLUE_D, radius=0.055)
        w_minus = Dot(color=GREEN_D, radius=0.055)

        w_plus.add_updater(
            lambda m: m.move_to(self.plane_point(w_plane, principal_root(z_complex())))
        )
        w_minus.add_updater(
            lambda m: m.move_to(self.plane_point(w_plane, -principal_root(z_complex())))
        )

        w_plus_trace = TracedPath(
            lambda: w_plus.get_center(),
            dissipating_time=0,
            stroke_color=BLUE_D,
            stroke_width=2.7,
        )
        w_minus_trace = TracedPath(
            lambda: w_minus.get_center(),
            dissipating_time=0,
            stroke_color=GREEN_D,
            stroke_width=2.7,
        )
        z_trace = TracedPath(
            lambda: z_moving.get_center(),
            dissipating_time=0,
            stroke_color=ORANGE,
            stroke_width=2.4,
        )

        phase_note = MathTex(r"\text{Plane: principal branch flips at } \arg z=\pi").scale(0.52).set_color(ORANGE).next_to(
            w_plane, DOWN, buff=0.74
        )

        flat_group = VGroup(
            z_plane, w_plane, z_axis_labels, w_axis_labels,
            z_heading, w_heading, branch_point, branch_label, cut_path, cut_text,
            loop_path, flat_value_block,
            z_moving, w_plus, w_minus, w_plus_trace, w_minus_trace, z_trace, phase_note
        )

        self.play(FadeIn(flat_group), run_time=1.1)
        self.wait(0.45)

        # 4) Use MoveAlongPath while also driving parameterized sqrt updates
        sweep_marker = Dot(self.plane_point(z_plane, self.plane_radius), color=RED, radius=0.04)
        self.add(sweep_marker)
        self.play(
            AnimationGroup(
                MoveAlongPath(sweep_marker, loop_path),
                loop_tracker.animate.set_value(1),
                lag_ratio=0,
            ),
            run_time=9,
            rate_func=linear,
        )
        self.play(FadeOut(sweep_marker), run_time=0.35)
        self.wait(0.5)

        # Re-orient the camera for the 3D Riemann-surface section.
        self.move_camera(phi=68 * DEGREES, theta=-60 * DEGREES, run_time=1.2)
        self.wait(0.2)

        # 6) Build two-sheeted warped Riemann surface in 3D
        axes_3d = ThreeDAxes(
            x_range=[-3, 3, 1],
            y_range=[-3, 3, 1],
            z_range=[-2.5, 2.5, 0.5],
            x_length=5.4,
            y_length=2.9,
            z_length=3.0,
            x_axis_config={"color": WHITE},
            y_axis_config={"color": WHITE},
            z_axis_config={"color": WHITE},
        ).move_to(DOWN * 2.72)

        re_label = MathTex(r"\Re(z)").scale(0.58).set_color(WHITE).next_to(
            axes_3d.x_axis, RIGHT, buff=0.15
        )
        im_label = MathTex(r"\Im(z)").scale(0.58).set_color(WHITE).next_to(
            axes_3d.y_axis, UP, buff=0.15
        )
        layer_label = MathTex(r"\text{Riemann-surface layer}").scale(0.58).set_color(WHITE).next_to(
            axes_3d.z_axis.get_top(), UP, buff=0.12
        )

        sheet0 = Surface(
            lambda r, th: self.sheet_xyz(r, th, 0),
            u_range=[self.r_min, self.surface_radius],
            v_range=[-PI + self.theta_eps, PI - self.theta_eps],
            resolution=(26, 44),
        )
        sheet1 = Surface(
            lambda r, th: self.sheet_xyz(r, th, 1),
            u_range=[self.r_min, self.surface_radius],
            v_range=[PI + self.theta_eps, 3 * PI - self.theta_eps],
            resolution=(26, 44),
        )

        sheet0.set_fill(sheet_color(0), opacity=0.68)
        sheet0.set_stroke(color=BLUE_C, width=1.1, opacity=0.95)
        sheet1.set_fill(sheet_color(1), opacity=0.68)
        sheet1.set_stroke(color=GREEN_C, width=1.1, opacity=0.95)

        surfaces = VGroup(sheet0, sheet1)

        # 7) Show explicit cut edges and identification across cut faces
        cut_edge_top = ParametricFunction(
            lambda r: self.sheet_xyz(r, PI - self.theta_eps, 0),
            t_range=[self.r_min, self.surface_radius, 0.04],
            color=RED_B,
            stroke_width=3.0,
        )
        cut_edge_bottom = ParametricFunction(
            lambda r: self.sheet_xyz(r, PI + self.theta_eps, 1),
            t_range=[self.r_min, self.surface_radius, 0.04],
            color=RED_B,
            stroke_width=3.0,
        )

        glue = VGroup()
        for r in np.linspace(self.r_min, self.surface_radius, 14):
            p_top = self.sheet_xyz(r, PI - self.theta_eps, 0)
            p_bot = self.sheet_xyz(r, PI + self.theta_eps, 1)
            glue.add(Line(p_top, p_bot, color=YELLOW_D, stroke_width=2.3, stroke_opacity=0.75))

        cut_label_3d = MathTex(r"\text{Branch cut}", color=RED_B).scale(0.52).next_to(
            cut_edge_top, RIGHT, buff=0.08
        )
        glue_label = MathTex(r"\text{Glue across cut}", color=YELLOW_D).scale(0.5).next_to(
            cut_edge_bottom, RIGHT, buff=0.08
        )
        identify_label = Text("identify edges", font_size=24, color=YELLOW_D).next_to(
            glue_label, DOWN, buff=0.05
        )

        sheet_labels = VGroup(
            MathTex(r"\text{Sheet 1: } \theta\in(-\pi,\pi)", color=BLUE_E).scale(0.50),
            MathTex(r"\text{Sheet 2: } \theta\in(\pi,3\pi)", color=GREEN_E).scale(0.50),
        )
        sheet_labels.arrange(DOWN, buff=0.12, aligned_edge=LEFT).next_to(axes_3d, RIGHT, buff=0.28).align_to(
            axes_3d, UP
        )

        sheet_formula = VGroup(
            MathTex(r"\sqrt{z}=\sqrt{r}\,e^{i\theta/2},\ \ \theta\in(-\pi,\pi)", color=BLUE_E).scale(0.52),
            MathTex(r"\sqrt{z}=\sqrt{r}\,e^{i\theta/2},\ \ \theta\in(\pi,3\pi)", color=GREEN_E).scale(0.52),
        ).arrange(DOWN, buff=0.1).next_to(sheet_labels, DOWN, buff=0.16).align_to(sheet_labels, LEFT)

        self.play(
            AnimationGroup(
                FadeIn(axes_3d),
                FadeIn(re_label),
                FadeIn(im_label),
                FadeIn(layer_label),
                lag_ratio=0.2,
            ),
            run_time=1.2,
        )
        self.play(Create(surfaces), Create(cut_edge_top), Create(cut_edge_bottom), Create(glue), run_time=3.0)
        self.play(
            AnimationGroup(
                FadeIn(sheet_labels),
                FadeIn(cut_label_3d),
                FadeIn(glue_label),
                FadeIn(identify_label),
                FadeIn(sheet_formula),
                lag_ratio=0.18,
            ),
            run_time=1.4,
        )
        self.wait(0.3)

        # 8) Animate one loop: discontinuous lift in plane, continuous on two-sheet surface
        lift_tracker = ValueTracker(0)

        lift_dot = Dot3D(radius=0.068, color=YELLOW)
        lift_dot.add_updater(lambda m: m.move_to(self.lifted_point(lift_tracker.get_value(), self.plane_radius)))

        lift_trace = TracedPath(
            lambda: lift_dot.get_center(),
            dissipating_time=0,
            stroke_color=YELLOW,
            stroke_width=4.0,
        )

        flat_lift_dot = Dot(
            radius=0.055,
            color=MAROON
        ).add_updater(
            lambda m: m.move_to(
                self.plane_point(
                    z_plane,
                    self.plane_radius * np.exp(1j * TAU * lift_tracker.get_value())
                )
            )
        )

        plane_discrete = MathTex(r"\text{Plane: principal branch jumps after a full loop}").scale(0.5).set_color(WHITE)
        surface_continuous = MathTex(r"\text{Lifted path on the Riemann surface is continuous}").scale(0.5).set_color(WHITE)
        plane_discrete.next_to(axes_3d, DOWN, buff=0.85).align_to(axes_3d, LEFT)
        surface_continuous.next_to(axes_3d, DOWN, buff=0.85).align_to(axes_3d, LEFT)

        # Also track the principal branch in the flat w-plane at the same time
        # to show the discontinuous jump across one loop.
        plane_jump_dot = Dot(color=MAROON, radius=0.055).add_updater(
            lambda m: m.move_to(
                self.plane_point(
                    w_plane,
                    principal_root(
                        self.plane_radius * np.exp(1j * TAU * lift_tracker.get_value())
                    ),
                )
            )
        )
        plane_jump_trace = TracedPath(
            lambda: plane_jump_dot.get_center(),
            dissipating_time=0,
            stroke_color=MAROON,
            stroke_width=2.7,
        )

        self.add(lift_dot, lift_trace, flat_lift_dot, plane_jump_dot, plane_jump_trace)
        self.play(Write(plane_discrete), run_time=0.75)
        self.wait(0.25)
        self.play(TransformMatchingTex(plane_discrete, surface_continuous), run_time=0.85)
        self.wait(0.25)
        self.play(lift_tracker.animate.set_value(1), run_time=9, rate_func=linear)

        # 9) Close on the key result
        final_text = MathTex(r"\text{Result: single-valued on Riemann surface}").scale(0.7).set_color(WHITE).next_to(
            axes_3d, DOWN, buff=0.6
        )
        self.play(TransformMatchingTex(surface_continuous, final_text), run_time=1.2)
        self.wait(1.0)


if __name__ == "__main__":
    # manim -pqh -r 1920,1080 riemann_surface_sqrt.py RiemannSurfaceSquareRoot
    pass
