(in-package cl.lag-markdown)
(defclass element nil
  nil)
(defgeneric to-markdown (instance))


(defmethod to-markdown ((text string))
  text)

(defclass paragraph (element)
  ((childen :type list ;; TODO: list must be element
            :initform '()
            :initarg :childen
            :accessor paragraph.childen)))

(defmethod to-markdown ((p paragraph))
  (format nil "~%~%~{~A~}~%~%"
          (mapcar #'to-markdown (paragraph.childen p))))

(defclass text-line (element)
  ((text :type string
         :accessor text-line.text
         :initarg :text
         :initform ""
         :documentation "TODO: Add documentation")
   (newline :type bool
            :accessor text-line.newline
            :initarg :newline
            :initform nil
            :documentation "TODO: Add documentation"))
  (:documentation "TODO: Add documentation"))

(defmethod to-markdown ((e text-line))
  (format nil "~A~:[~;  ~%~]" (text-line.text e) (text-line.newline e)))

(defclass header (element)
  ((name :type string
         :accessor header.name
         :initform "Default Title"
         :initarg :name
         :documentation "TODO: Add documentation")
   (level :type integer
          :accessor header.level
          :initarg :level
          :initform 1
          :documentation "The Title Level, Common allow 1~5
==========================================================

level 1:
# title #

level 2:
## title ##
")
   (content :type list  ;; TODO: list must be element
            :initform '()
            :initarg :content
            :accessor header.content))
  (:documentation "TODO: Add documentation"))

(defmethod to-markdown ((e header) &aux (pre-header (repeat-string "#" (header.level e))))
  (format nil "~&~A ~A ~0@*~A~1*~%~{~A~}~&"
          pre-header
          (header.name e)
          (mapcar #'to-markdown (header.content e))))

(defun repeat-string (str times)
  (let ((result ""))
    (dotimes (_ times result)
      (setf result (concatenate 'string result str)))))

;; TODO: list element
;; TODO: order list element

;; TODO: table

;; TODO: link

;; TODO: image
