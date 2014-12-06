(define MKPORT #f)

(define (xmfpath name)
	(if (string=? name "xmonad.hs")
		(display
			(string-append
				(gmk-expand 'XMDIR) "/" name) MKPORT)
		(display
			(string-append
				(gmk-expand 'XMDIR) "/Gfxt/" name) MKPORT)))
