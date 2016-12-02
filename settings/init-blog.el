;;; init-blog.el --- blog settings

;; org-mode for blogging
(require 'ox-publish)

(defvar my-site-org-source
  "~/Projects/qiyiping/qiyiping.github.com/org/"
  "site org source")

(defvar my-site-common-resource
  "~/.emacs.d/org-publish/"
  "site common resource")

(defvar my-site-publishing-directory
  "~/Projects/qiyiping/qiyiping.github.com/"
  "site publishing directory")


(setq org-publish-project-alist
      (list
       `("site-pages"
         :base-directory ,my-site-org-source
         :base-extension "org"
         :publishing-directory ,my-site-publishing-directory
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-sitemap t
         :sitemap-title "Sitemap"
         :sitemap-style 'tree
         :html-preamble "<div>
<a href=\"/index.html\">Home</a>
<a href=\"/sitemap.html\">SiteMap</a>
<a href=\"/about/index.html\">About</a>
<a href=\"https://github.com/qiyiping\">Github</a>
</div>"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/css/worg.css\"/>"
         :html-postamble nil
         )
       `("common-static"
         :base-directory ,my-site-common-resource
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,my-site-publishing-directory
         :recursive t
         :publishing-function org-publish-attachment
         )
       `("site-static"
         :base-directory ,my-site-org-source
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,my-site-publishing-directory
         :recursive t
         :publishing-function org-publish-attachment
         )
       '("site"
         :components ("site-pages" "site-static" "common-static"))))

(defun my-post-file-from-title (title)
  (concat (replace-regexp-in-string
           " "
           "-"
           (downcase
            (replace-regexp-in-string
             "[^a-zA-Z0-9 ]"
             ""
             title)))
          ".org"))

(defun my-create-post ()
  (interactive)
  (let* ((date (format-time-string "%Y-%m-%d"))
         (title (read-string "Title: "))
         (post-file-name (my-post-file-from-title title))
         (keywords (read-string "Keywords: "))
         (post-dir (expand-file-name "post" my-site-org-source))
         (post-date-dir (expand-file-name date post-dir)))
    (unless (file-exists-p post-dir)
      (mkdir post-dir))
    (unless (file-exists-p post-date-dir)
      (mkdir post-date-dir))
    (let* ((post-buffer (find-file
                         (expand-file-name
                          post-file-name
                          post-date-dir))))
      (insert (format
               "#+SETUPFILE: %s
#+TITLE: %s
#+KEYWORDS: %s
"
               (concat my-site-common-resource
                       "templates/post-template.setup")
               title
               keywords)))))

(setq httpd-root my-site-publishing-directory)

(defun my-site-http-start ()
  (interactive)
  (httpd-start)
  (browse-url "http://localhost:8080/sitemap.html"))
