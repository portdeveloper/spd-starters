;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo_game) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 600)
(define HEIGHT 400)

(define MISSILE (triangle 40 "solid" "tan"))

(define TANK (rectangle 20 10 "solid" "darkgreen"))

(define UFO (ellipse 20 10 "solid" "yellow"))

(define MTS (rectangle WIDTH HEIGHT "solid" "white"))

