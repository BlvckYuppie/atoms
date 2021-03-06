###
Device detection

@namespace Atoms

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

Atoms.$ ->
  OS =
    ios           : /ipad|iphone|ipod/i
    android       : /android/i
    blackberry    : /blackberry|bb10/i
    webos         : /webos/i
    windows_phone : /windows phone/i
    firefox_os    : /(Mozilla).*Mobile[^\/]*\/([\d\.]*)/
  useragent = navigator.userAgent.toLowerCase()

  ###
  Set in Atoms.Device the device OS
  @method resize
  ###
  os = ->
    Atoms.Device.os = undefined
    for type, regexp of OS when regexp.test(useragent) is true
      Atoms.Device.os = type
      Atoms.$(document.body).attr "data-os", type
      break

  ###
  Set in Atoms.Device the device screen resolution
  @method resize
  ###
  resize = ->
    w = window.innerWidth
    h = window.innerHeight
    size = if (h > w and w < 480) or (h < w and h < 480) then "small" else "normal"
    Atoms.Device.width = w
    Atoms.Device.height = h
    Atoms.Device.screen = size
    Atoms.$(document.body).attr "data-screen", size

  do os
  do resize
  Atoms.$(window).on "resize", resize
  Atoms.$(window).on "orientationchange", resize
