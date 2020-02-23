(defpackage cl.lag-markdown/test
  (:use :cl :cl.lag-markdown :fiveam))

(in-package cl.lag-markdown/test)

(test to-markdown
  (is-true (string= (to-markdown (make-instance 'text-line
                                                :text "Hello"
                                                :newline nil))
                    "Hello"))
  (is-true (string= (to-markdown (make-instance 'text-line
                                                :text "Hello"
                                                :newline t))
                    (format nil "Hello  ~&")))
  (is-true
   (string= (to-markdown (make-instance 'header
                                        :name "Title"
                                        :level 1))
            "# Title #
"))
  (is-true
   (string= (to-markdown (make-instance 'header
                                        :name "Title"
                                        :level 1
                                        :content `(,(make-instance 'text-line
                                                                   :text "Hello, "
                                                                   :newline nil)
                                                   ,(make-instance 'text-line
                                                                   :text "World"
                                                                   :newline t))))
            (format nil "# Title #
Hello, World  ~&")))
  (is-true
   (string= (to-markdown (make-instance 'header
                                        :name "Title"
                                        :level 1
                                        :content `(,(make-instance 'text-line
                                                                   :text "Hello, "
                                                                   :newline nil)
                                                   ,(make-instance 'text-line
                                                                   :text "World"
                                                                   :newline t)
                                                   ,(make-instance 'text-line
                                                                   :text "Bye Bye"
                                                                   :newline nil))))
            (format nil  "# Title #
Hello, World  ~&Bye Bye
")))
  (is-true
   (string= (to-markdown (make-instance 'header
                                        :name "Title"
                                        :level 1
                                        :content `(,(make-instance 'text-line
                                                                   :text "Hello, "
                                                                   :newline nil)
                                                   ,(make-instance 'text-line
                                                                   :text "World"
                                                                   :newline t)
                                                   "Bye Bye")))(format nil "# Title #
Hello, World  ~&Bye Bye
"))))


(run!)

