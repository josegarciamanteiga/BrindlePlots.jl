
default_colors( n::Int ) = [Scale.color_continuous().f(p) for p in linspace(0, 1, n)]
default_colors( n::Int, opacity::Float64 ) = [(t = convert(Gadfly.RGBA, c); 
                                              return Gadfly.RGBA(t.r, t.g, t.b, opacity)) 
                                              for c in default_colors(n)]


const DEFAULT_COLOR = default_colors(6)[1]

plot_dimensions( n::Int ) = 24cm, Measures.Length{:mm,Float64}( 10*(4 + n*4) )
set_plot_size( n::Int ) = set_default_plot_size( plot_dimensions( n )... )


arc_theme( psi::Float64, color=DEFAULT_COLOR ) = Theme(default_color=color, line_width=Measures.Length{:mm,Float64}( psi * ARCWIDTH ))
polygon_theme( color=DEFAULT_COLOR ) = Theme(default_color=color, discrete_highlight_color=x->colorant"black")
gelband_theme( size::Int, agarose::Float64, psi::Float64, color=DEFAULT_COLOR ) = Theme(default_color=color, line_width=Measures.Length{:mm,Float64}( migration_proportion( size, agarose )*BANDTHICK / 3 + psi*BANDTHICK / 1.5 )) 
default_theme() = Theme(default_color=colorant"black")


