(in-package cl.lag-markdown)


(string= (to-markdown (make-instance 'text-line
                                     :text "Hello"
                                     :newline nil))
         "Hello")

(string= (to-markdown (make-instance 'text-line
                                     :text "Hello"
                                     :newline t))
         "Hello
")

(string= "# Title #
"
         (to-markdown (make-instance 'header
                                     :name "Title"
                                     :level 1)))

(string= (format nil "# Title #
Hello, World  ~&")
         (to-markdown (make-instance 'header
                                     :name "Title"
                                     :level 1
                                     :content `(,(make-instance 'text-line
                                                                :text "Hello, "
                                                                :newline nil)
                                                 ,(make-instance 'text-line
                                                                 :text "World"
                                                                 :newline t)))))
(string= (format nil  "# Title #
Hello, World  ~&Bye Bye
")
         (to-markdown (make-instance 'header
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
                                                                 :newline nil)))))
(string= (format nil "# Title #
Hello, World  ~&Bye Bye
")
         (to-markdown (make-instance 'header
                                     :name "Title"
                                     :level 1
                                     :content `(,(make-instance 'text-line
                                                                :text "Hello, "
                                                                :newline nil)
                                                 ,(make-instance 'text-line
                                                                 :text "World"
                                                                 :newline t)
                                                 "Bye Bye"))))
