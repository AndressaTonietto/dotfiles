" Vim syntax file
" Language: Personal Todos
" Maintainer: Gustavo Tonietto
" Latest Revision: 07 November 2018

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword todoTitle contained TODO DOING DONE FEITO FAZER FAZENDO PRÓXIMO PRÓXIMOS PLANNING PLANNINGS LIMBO
syn match todoComment	"#.*$" contains=todoContext,todoTitle
syn match todoProject	/^.\+:  / contains=todoContext
syn match todoGroup	/^>.\+:/ contains=todoContext
syn match todoImportant	/^!.\+:/ contains=todoContext
syn match todoListItem	/^.*\s\\_\(\(\s\|([^)]*)\).*\)\?$/ contains=todoContext,todoComment
syn match todoContext	/\s\zs@[^ \t(]\+\(([^)]*)\)\?/
syn match todoDone	  /^.*\s!done\(\(\s\|([^)]*)\).*\)\?$/ contains=todoProject,todoContext
syn match todoCancelled  /^.*\s!cancelled\(\(\s\|([^)]*)\).*\)\?$/ contains=todoProject,todoContext

syn sync fromstart

"highlighting for todo groups
hi def link todoListItem      Statement
hi def link todoContext       Label
hi def link todoProject       Ignore
hi def link todoGroup         Todo
hi def link todoImportant     Error
hi def link todoTitle         Title
hi def link todoDone          Identifier
hi def link todoCancelled     Tag
hi def link todoComment       Comment

let b:current_syntax = "todos"

" vim: ts=8
