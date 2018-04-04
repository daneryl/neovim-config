Plug 'Galooshi/vim-import-js', {'for': 'javascript.jsx', 'do': 'npm install -g import-js' }
Plug 'maksimr/vim-jsbeautify', {'for': 'javascript.jsx', 'do': 'npm install -g js-beautify' }

Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript.jsx' }
"
"chained methods without indentation
let g:javascript_continuation = '\%([*,?:]\|+\@<!+\|-\@<!-\|\*\@<!\/\|=\|||\|&&\)'
let g:javascript_opfirst = '\%([,:?^%]\|\([-/+]\)\%(\1\|\*\|\/\)\@!\|\*\/\@!\|=>\@!\||\|&\|in\%(stanceof\)\=\>\)\C'
let g:jsx_ext_required = 0
