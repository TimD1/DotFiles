" Vim syntax file
" Language:	Nextflow
" Author:	Tim Dunn <tjdunn18@gmail.com>
" Version: 	0.0.0
" Last Change:	2024 July 20

if exists("b:current_syntax")
  finish
endif

"===================
"===== GROOVY ======
"===================
" Language:	Groovy
" Original Author:	Alessio Pace <billy.corgan AT tiscali.it>
" Maintainer:	Tobias Rapp <yahuxo+vim AT mailbox.org>
" Version: 	0.1.18
" URL:	  http://www.vim.org/scripts/script.php?script_id=945
" Last Change:	2021 Feb 03

" keyword definitions
syn keyword groovyExternal        native package
syn match groovyExternal          "\<import\>\(\s\+static\>\)\?"
syn keyword groovyError           goto const
syn keyword groovyConditional     if else switch
syn keyword groovyRepeat          while for do
syn keyword groovyBoolean         true false
syn keyword groovyConstant        null
syn keyword groovyTypedef         this super
syn keyword groovyOperator        new instanceof
syn keyword groovyType            boolean char byte short int long float double
syn keyword groovyType            void
syn keyword groovyType		      Integer Double Date Boolean Float String Array Vector List
syn keyword groovyStatement       return
syn keyword groovyStorageClass    static synchronized transient volatile final strictfp serializable
syn keyword groovyExceptions      throw try catch finally
syn keyword groovyAssert          assert
syn keyword groovyMethodDecl      synchronized throws
syn keyword groovyClassDecl       extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syn match   groovyTypedef         "\.\s*\<class\>"ms=s+1
syn keyword groovyClassDecl         enum
syn match   groovyClassDecl       "^class\>"
syn match   groovyClassDecl       "[^.]\s*\<class\>"ms=s+1
syn keyword groovyBranch          break continue nextgroup=groovyUserLabelRef skipwhite
syn match   groovyUserLabelRef    "\k\+" contained
syn keyword groovyScopeDecl       public protected private abstract

" Groovy stuff
syn match groovyOperator "\.\."
syn match groovyOperator "<\{2,3}"
syn match groovyOperator ">\{2,3}"
syn match groovyOperator "->"
syn match groovyLineComment       '^\%1l#!.*'  " Shebang line
syn match groovyExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"

" Groovy JDK stuff
syn keyword groovyJDKBuiltin    as def in
syn keyword groovyJDKOperOverl  div minus plus abs round power multiply
syn keyword groovyJDKMethods 	each call inject sort print println
syn keyword groovyJDKMethods    getAt putAt size push pop toList getText writeLine eachLine readLines
syn keyword groovyJDKMethods    withReader withStream withWriter withPrintWriter write read leftShift
syn keyword groovyJDKMethods    withWriterAppend readBytes splitEachLine
syn keyword groovyJDKMethods    newInputStream newOutputStream newPrintWriter newReader newWriter
syn keyword groovyJDKMethods    compareTo next previous isCase
syn keyword groovyJDKMethods    times step toInteger upto any collect dump every find findAll grep
syn keyword groovyJDKMethods    inspect invokeMethods join
syn keyword groovyJDKMethods    getErr getIn getOut waitForOrKill
syn keyword groovyJDKMethods    count tokenize asList flatten immutable intersect reverse reverseEach
syn keyword groovyJDKMethods    subMap append asWritable eachByte eachLine eachFile
syn cluster groovyTop add=groovyJDKBuiltin,groovyJDKOperOverl,groovyJDKMethods

" it is a better case construct than java.vim to match groovy syntax
syn region  groovyLabelRegion     transparent matchgroup=groovyLabel start="\<case\>" matchgroup=NONE end=":\|$" contains=groovyNumber,groovyString,groovyLangClass,groovyJavaLangClass
syn match   groovyUserLabel       "^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=groovyLabel
syn keyword groovyLabel           default

" The following cluster contains all groovy groups except the contained ones
syn cluster groovyTop add=groovyExternal,groovyError,groovyError,groovyBranch,groovyLabelRegion,groovyLabel,groovyConditional,groovyRepeat,groovyBoolean,groovyConstant,groovyTypedef,groovyOperator,groovyType,groovyType,groovyStatement,groovyStorageClass,groovyAssert,groovyExceptions,groovyMethodDecl,groovyClassDecl,groovyClassDecl,groovyClassDecl,groovyScopeDecl,groovyError,groovyError2,groovyUserLabel,groovyLangObject

" Comments
syn keyword groovyTodo             contained TODO FIXME NB
syn region  groovyComment          start="/\*"  end="\*/" contains=groovyTodo,@Spell
syn match   groovyCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   groovyCommentStar      contained "^\s*\*$"
syn match   groovyLineComment      "//.*" contains=groovyTodo,@Spell
hi def link groovyCommentString groovyString
hi def link groovyComment2String groovyString
hi def link groovyCommentCharacter groovyCharacter
syn cluster groovyTop add=groovyComment,groovyLineComment

" match the special comment /**/
syn match   groovyComment          "/\*\*/"

" Strings and constants
syn match   groovySpecialError     contained "\\."
syn match   groovySpecialCharError contained "[^']"
syn match   groovySpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\|\$\)"
syn match   groovyRegexChar        contained "\\."
syn region  groovyString          start=+"+ end=+"+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell,groovyELExpr
syn region  groovyString          start=+'+ end=+'+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell
syn region  groovyString          start=+"""+ end=+"""+ contains=groovySpecialChar,groovySpecialError,@Spell,groovyELExpr
syn region  groovyString          start=+'''+ end=+'''+ contains=groovySpecialChar,groovySpecialError,@Spell
" syn region groovyELExpr start=+${+ end=+}+ keepend contained
syn match groovyELExpr /\${.\{-}}/ contained
" Fix: force use of the NFA regexp engine (2), see GitHub issue #7280
syn match groovyELExpr /\%#=2\$[a-zA-Z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u00FF\u0100-\uFFFE_][a-zA-Z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u00FF\u0100-\uFFFE0-9_.]*/ contained
hi def link groovyELExpr Identifier
syn match   groovyNumber           "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   groovyNumber           "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   groovyNumber           "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   groovyNumber           "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn match   groovySpecial "\\u\d\{4\}"
syn cluster groovyTop add=groovyString,groovyCharacter,groovyNumber,groovySpecial,groovyStringError
syn match groovyExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"

" ###############################
" java.vim default highlighting
hi def link groovyFuncDef		Function
hi def link groovyBraces		Function
hi def link groovyBranch		Conditional
hi def link groovyUserLabelRef	groovyUserLabel
hi def link groovyLabel		    Label
hi def link groovyUserLabel		Label
hi def link groovyConditional	Conditional
hi def link groovyRepeat		Repeat
hi def link groovyExceptions	Exception
hi def link groovyAssert 		Statement
hi def link groovyStorageClass	StorageClass
hi def link groovyMethodDecl	groovyStorageClass
hi def link groovyClassDecl		groovyStorageClass
hi def link groovyScopeDecl		groovyStorageClass
hi def link groovyBoolean		Boolean
hi def link groovySpecial		Special
hi def link groovySpecialError	Error
hi def link groovySpecialCharError	Error
hi def link groovyString		String
hi def link groovyRegexChar		String
hi def link groovyCharacter		Character
hi def link groovySpecialChar	SpecialChar
hi def link groovyNumber		Number
hi def link groovyError		    Error
hi def link groovyStringError	Error
hi def link groovyStatement		Statement
hi def link groovyOperator		Operator
hi def link groovyComment		Comment
hi def link groovyDocComment	Comment
hi def link groovyLineComment	Comment
hi def link groovyConstant		Constant
hi def link groovyTypedef		Typedef
hi def link groovyTodo		    Todo

hi def link groovyCommentTitle	SpecialComment
hi def link groovyDocTags		Special
hi def link groovyDocParam		Function
hi def link groovyCommentStar	groovyComment

hi def link groovyType		    Type
hi def link groovyExternal		Include

hi def link htmlComment		    Special
hi def link htmlCommentPart		Special
hi def link groovySpaceError	Error
hi def link groovyJDKBuiltin    Special
hi def link groovyJDKOperOverl  Operator
hi def link groovyJDKMethods    Function


"==================
"==== NEXTFLOW ====
"==================

syn region  nextflowBlockString          start=+'''+ keepend end=+'''+ contains=groovySpecialChar,groovySpecialError,@Spell,nextflowELExpr,@shell
syn match nextflowELExpr "\!{.\{-}}" contained

syn keyword nextflowDirective  accelerator afterScript arch array beforeScript cache clusterOptions conda container containerOptions cpus debug disk echo errorStrategy executor ext fair label machineType maxSubmitAwait maxErrors maxForks maxRetries memory module penv pod publishDir queue resourceLabels resourceLimits scratch shell spack stageInMode stageOutMode storeDir tag time validExitStatus 
" directory contentType enabled ignoreErrors mode overwrite path storageClass tags
" index header mapper path sep
syn match nextflowBlock "\v(emit|exec|input|main|optional|output|publish|script|shell|stub|take|topic|type|when|):"
" implicit variables, functions, classes, config, scopes
syn keyword nextflowImplicit 
    \ attempt hash index launchDir moduleDir name nextflow params process projectDir secrets workDir workflow
    \ branchCriteria error exit file files groupKey multiMapCriteria sendMail tuple
    \ Channel Duration MemoryUnit ValueObject
    \ includeConfig cleanup dumpHashes resume workDir profiles 
    \ apptainer aws azure charliecloud conda dag docker env executor fusion google k8s main manifest nextflow notification params podman process report sarus shifter singularity spack timeline tower trace wave workflow
syn keyword nextflowKeyword    from include into task
syn keyword nextflowType       Channel channel each env eval file path stdin stdout tuple val 
syn keyword nextflowChannelFactories empty from fromList fromPath fromFilePairs fromSRA interval of topic value watchPath
syn keyword nextflowConstant   null
syn keyword nextflowOperator   branch buffer collate collect collectFile combine concat count countFasta countFastq countJson countLines cross distinct dump filter first flatMap flatten groupTuple ifEmpty join last map max merge min mix multiMap out randomSample reduce set splitCsv splitFasta splitFastq splitJson splitText subscribe sum take tap toInteger toList toSortedList transpose unique until view


" Apply highlighting
let b:current_syntax = "nextflow"
hi def link nextflowELExpr            Identifier
hi def link groovyELExpr              Identifier
hi def link nextflowConstant          Constant
hi def link nextflowDirective         Statement
hi def link nextflowKeyword           Operator
hi def link nextflowChannelFactories  Operator
hi def link nextflowOperator          Operator
hi def link nextflowType              Type
hi def link nextflowImplicit          Special
hi def link nextflowBlock             Function
hi def link nextflowBlockString       String
