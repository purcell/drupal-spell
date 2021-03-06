;;; drupal-spell.el --- Aspell extra dictionary for Drupal

;; Copyright (C) 2013  Arne Jørgensen

;; Author: Arne Jørgensen <arne@arnested.dk>
;; URL: https://github.com/arnested/drupal-spell
;; Created: March 22, 2013
;; Version: 0.1.0
;; Keywords: wp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; An extra dictionary for aspell with Drupal specific terminology.

;;; Code:

(require 'ispell)

;;;###autoload
(defcustom drupal-spell-extra-dict (let ((dict (concat (file-name-directory
                                                        (or load-file-name buffer-file-name))
                                                       "dict/drupal.aspell")))
                                     (if (file-readable-p dict)
                                       dict
                                       ""))
  "Location of the Drupal aspell dictionary."
  :type '(file :must-match t)
  :safe t
  :group 'ispell)

;;;###autoload
(defun drupal-spell-enable nil
  "Enable Drupal dictionary as aspell extra dictionary in current buffer."
  (interactive)
  (when ispell-really-aspell
    (add-to-list (make-local-variable 'ispell-extra-args) (concat "--add-extra-dicts=" drupal-spell-extra-dict))))

;;;###autoload
(add-hook 'drupal-mode-hook 'drupal-spell-enable)



(provide 'drupal-spell)

;;; drupal-spell.el ends here
