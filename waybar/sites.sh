#!/bin/bash

choice=$(printf "Gpt\nYouTube\nGitHub" | fuzzel --dmenu --prompt "Open site:")

case "$choice" in
  Gpt)
    xdg-open "https://chatgpt.com/"
    ;;
  YouTube)
    xdg-open "https://youtube.com"
    ;;
  GitHub)
    xdg-open "https://github.com/sammylwm?tab=repositories"
    ;;
  *)
    ;;
esac
