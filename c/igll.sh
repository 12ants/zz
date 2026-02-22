#!/bin/bash
## ig ll
printf %b "\ngg\nuploading ...\n"; 
igstory="$(curl -sX POST "https://graph.instagram.com/v25.0/17841477140456200/media" -F "media_type=STORIES" -F "image_url=https://aa.aeniks.com/words/img/ll.jpg" -F "caption=aaaaaaaaaaaa" -F "access_token=IGAAIcnwJCEa1BZAFktNTg4cWZAyZAXZAWb3VWWjNGbnRBZADBIYU5kakdmbmdGV2RHMkR3WDhpR2ppeXh5Mkc0VkdsVVdScFRRMllBWjFXTzdXemZAfTm9oa0xtTTBRQlJXVzBtTWlpX0pYbDB1ZADZAiUUJUVEpRQmt2Um5MSWpFR2pVawZDZD"|cut -f2- -d":"|tr -d '\"{}')"; 
####
printf %b "\nid:\n$igstory ...\n\t "; 
for i in {1..22}; do printf %b "$i."; sleep 1; done; printf %b "\ngg\n"; 
####
curl -sX POST "https://graph.instagram.com/v25.0/17841477140456200/media_publish" -H "Content-Type: application/json" -H "Authorization: Bearer IGAAIcnwJCEa1BZAFktNTg4cWZAyZAXZAWb3VWWjNGbnRBZADBIYU5kakdmbmdGV2RHMkR3WDhpR2ppeXh5Mkc0VkdsVVdScFRRMllBWjFXTzdXemZAfTm9oa0xtTTBRQlJXVzBtTWlpX0pYbDB1ZADZAiUUJUVEpRQmt2Um5MSWpFR2pVawZDZD" -d "{ "creation_id":"$igstory" }"; 
####
####


#### image_max_width: 1440px

# curl -X POST "https://rupload.facebook.com/ig-api-upload/<API_VERSION>/<IG_MEDIA_CONTAINER_ID>`" -H "Authorization: OAuth <ACCESS_TOKEN>" -H "offset: 0" -H "file_size: Your_file_size_in_bytes" --data-binary "@my_video_file.mp4"
