;;; learnxinyminutes ---- summary
;;; Commentary:
;;; Commentary:package --- learn elisp in y minutes

;;; Code:
(+ 2 2)

(+ 2 (+ 1 1))

;; 'setq ' stores a value into a variable
(setq my-name "Damon")

;; 'insert' will insert "Hello!" where the cursor is
(insert "Hello!")Hello!

;; We used `insert' with only on arguemnt "Hello!", but
;; we can pass more arguments -- here we use two:
(insert "Hello" " world!")Hello world!

;; You can use variables instead of strings
(insert "Hello, I am " my-name)Hello, I am Damon

;; You can combine sexps into functions:
(defun hello() (insert "Hello, I am " my-name))

;; You can evaluate functions:
(hello)Hello, I am Damon

;; The empty parentheses in the function's definition means that
;; it does not accept arguments. But always using `my-name' is 
;; boring, let's tell the function to accept one argument (here
;; the argument is called "name"):
(defun hello (name) (insert "Hello " name))

;; Now let's call the function with the string "you" ass the value
;; for its unique argument:
(hello "you are damon")Hello you are damon

;; Yeah! Take a breath

;; Now switch to a new buffer named "*test*" in another window:
;; `C-xC-e' [screen has two windows and cursor is in the *test* buffer]
;; The "*test*" buffer will be created by the function
(switch-to-buffer-other-window "*test*")

;; You can combine serveral sexps with `progn':
(progn
  (switch-to-buffer-other-window "*test*")
  (hello "you\n")
  (hello my-name))

;; It's often userful to erase the buffer:
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "there"))

;; Or to go back to the other window:
(progn (switch-to-buffer-other-window "*test*")
       (erase-buffer)
       (hello "here")
       (other-window 1))

;; You can bind a value to a local variable with `let':
(let ((local-name "Damon"))
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello local-name)
  (other-window 1))

;; No need to use `progn' in that case, since `let' also combines
;; several sexps

;; Let's format a string:
;; %s is a place-holder for a string, replaced by "visitor".
;; \n is the newline character
(format "Hello %s!\n" "visitor")

;; Let's refine our function by using format:
(defun hello (name)
  (insert (format "Hello %s!\n" name)))

(hello "Damon")

;; Let's create another function which uses `let':
(defun greeting (name)
  (let ((your-name "Damon"))
    (insert (format "Hello %s!\n\nI am %s."
                    name      ; the argument of the function
                    your-name ; the let-bound variable "Damon
                    ))))

;; And evaluate it:
(greeting "Alpha")

;; Some functions are interactive:
(read-from-minibuffer "Enter your name:")
;; Evaluating this function returns what you entered at the prompt

;; Let's make our `greeting' function prompt for your name:
(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (insert (format "Hello!\n\nI am %s and you are %s."
                    from-name ; the argument of the function
                    your-name ; the let-bound var, entered at prompt
                    ))))

(greeting "Alpha")

;; Let's complete it by displaying the results in the other window:
(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name:")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\nI am %s." your-name from-name))
    (other-window 1)))

;; Now test it:
(greeting "Alpha")


;; Take a breath

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Let's store a list of names:
(setq list-of-names '("Sarah" "Chloe" "Mathilde"))

;; Get the first element of this list with `car':
(car list-of-names)

;; Get a list of all but the first element with `cdr':
(cdr list-of-names)

;; Add an element to the beginning of a list with `push';
(push "Stephanie" list-of-names)

;; NOTE: `car' and `cdr' don't modify the list, but `push' does.
;; This is an important difference: some functions don't have any
;; side-effects (like `car') while others have (like `push').

;; Let's call `hello' for each element in `list-of-names':
(mapcar 'hello list-of-names)

;; Refine `greeting' to say hello to everyone in `list-of-names':
(defun greeting ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (other-window 1)
  )

(greeting)

;; Remember the `hello' function we defined above? It takes one
;; argument, a name. `mapcar' calls `hello', successively using each
;; element of `list-of-names' as the argument for `hello'.

;; Now let's arrage a bit what we have in the displayed buffer:
(defun replace-hello-by-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (search-forward "Hello")
    (replace-match "Bonjour"))
  (other-window 1))

;; (goto-char (point-min)) goes to the beginning of the buffer.
;; (search-forward "Hello") searches for the string "Hello".
;; (while x y) evaluates the y sexp(s) while x returns something.
;; If x returns `nil' (nothing), we exit the while loop.

(replace-hello-by-bonjour)

;; You should see all occurrences of "Hello" in the *test* buffer
;; replaced by "Bonjour".

;; You should also get an error: "Search failed: Hello".
;;
;; To avoid this error, you need to tell `search-forward' whether it
;; should stop searching at some point in the buffer, and whether it
;; should silently fail when nothing is found:

;; (search-forward "Hello" nil 't) does the trick:

;; The `nil' argument says: the search is not bound to a position.
;; The `t' argument says: silently fail when nothing is found.
;; We use this sexp in the function below, which doesn't throw an error:

(defun hello-to-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  ;; Say hello to names in 'list-of-names'
  (mapcar 'hello list-of-names)  ;; hello is a function
  (goto-char (point-min))
  ;; Replace "Hello" by "Bonjour"
  (while (search-forward "Hello" nil 't)
    (replace-match "Bonjour"))
  (other-window 1))

(hello-to-bonjour)

;; Let's colorize the names:
(defun boldify-names ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (re-search-forward "Bonjour \\(.+\\)!" nil 't)
    (add-text-properties (match-beginning 1)
                         (match-end 1)
                         (list 'face 'bold)))
  (other-window 1))

;; This functions introduces `re-search-forward': instead of
;; searching for the string "Bonjour", you search for a pattern,
;; using a "regular expression" (abbreviated in the prefix "re-").

;; The regular expression is "Bonjour \\(.+\\)!" and it reads:
;; the string "Bonjour ", and
;; a group of | this is the \\( ... \\) construct
;;   any character      | this is the .
;;   possibly repeated  | this is the +
;; and the "!" string.

;; Ready? Test it!

(boldify-names)

;; `add-text-properties` adds... text properties, like a face.

;; OK, we are done. Happy hacking!

;; If you want to know more about a variable or a function:
;;

;; C-h v a-variable RET
;; C-h f a-function RET

;; To read the Emacs Lisp manual with Emacs:
;; C-h i m elisp RET
;;
;;
;;
;;












(provide 'learnxinyminutes)

;;; learnxinyminutes ends here
