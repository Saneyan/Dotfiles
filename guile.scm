(define (xmfpath paths)
	(define (print path)
		(if (string=? path "xmonad.hs")
			(string-append (gmk-var 'XMDIR) "/" path " ")
			(string-append (gmk-var 'XMDIR) "/Gfxt/" path " ")))
	(let iter ((ps paths) (path ""))
		(if (null? ps) path
			(iter (cdr ps) (string-append (print (car ps)) path)))))
