# --- Make latexmk rebuild when *any* .tex file changes ---
$dependents_list = 1;

# --- Treat both as main files ---
@default_files = ('main.tex');

# --- Optional custom dependency rule (force rebuild on any .tex change) ---
add_cus_dep('tex','pdf',0,'mytex');
sub mytex {
    system("xelatex $_[0]");
}

add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
    system("makeglossaries $_[0]");
}
