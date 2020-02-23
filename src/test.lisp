(defpackage cl.lag-markdown/test
  (:use :cl :cl.lag-markdown :fiveam))

(in-package cl.lag-markdown/test)

(test to-markdown
  (is-every string=
    ((to-markdown (make-instance 'text-line
                                    :text "Hello"
                                    :newline nil))
        "Hello")
    ((to-markdown (make-instance 'text-line
                                                   :text "Hello"
                                                   :newline t))
                       (format nil "Hello  ~&"))
    ((to-markdown (make-instance 'header
                                                   :name "Title"
                                                   :level 1))
                       "# Title #
")
    ((to-markdown (make-instance 'header
                                                   :name "Title"
                                                   :level 1
                                                   :content `(,(make-instance 'text-line
                                                                              :text "Hello, "
                                                                              :newline nil)
                                                              ,(make-instance 'text-line
                                                                              :text "World"
                                                                              :newline t))))
                       (format nil "# Title #
Hello, World  ~&"))
    ((to-markdown (make-instance 'header
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
"))
    ((to-markdown (make-instance 'header
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
