fun! s:DetectNextflow()
    if getline(1) == "#!/usr/bin/env nextflow"
        set ft=nextflow
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectNextflow()
autocmd BufNewFile,BufRead *.nf set syntax=nextflow
autocmd BufNewFile,BufRead *.nextflow set syntax=nextflow
autocmd BufNewFile,BufRead *.config set syntax=nextflow
