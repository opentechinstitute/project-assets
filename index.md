---
title: "Home"
layout: default
lang: en
menu:
  name: home
  parent: main
  position: 1
---
Welcome to OTI's graphical assets library. Use the menu to browser for assets you wish to utilize.

## Naming Conventions and Categories

To manage OTI’s graphic assets, a Github repository will be used, and a web front-end will dynamically display the contents of that repository. All of the assets created for OTI’s projects will be stored here, for universal access and sharing.

## Types of files

If possible, vector graphics in an open format such as Scalable Vector Graphics (.svg files) should be used. When bitmaps are necessary, a low-compression Portable Network Graphics (.png files) should be used.

## Licensing

Graphic elements should be licensed under a <a href="https://creativecommons.org/licenses/by-sa/4.0/legalcode" target="_blank">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

## Naming conventions

Graphic assets should be named in a simple but descriptive manner. For instance, a file containing images of trees would be named something like “Trees.svg”. When there are groups or multiples of images, a type or number can be appended to the name, such as “Router_omnidirectional_01.svg”, “Router_directional_01.svg”, and “Router_directional_02.svg”.

## Adding new directories and index pages

This site is designed to provide as simple an interface as possible for adding new directories and files, while retaining all files in version control.

To add a new folder or sub-folder, create the directory in the desired location within the site structure, add your files to it, then create an index.md page within the new folder using the template below:

	---
	title: "New Category"
	layout: default
	lang: en
	menu:
	  name: new-category-no-spaces
	  parent: basic-elements
	  position: 1
	---
	{% raw %}{% image_set Commotion/Basic-Elements/New-Category/ %}{% endraw %}
	{% raw %}{% file_set Commotion/Basic-Elements/New-Category/ %}{% endraw %}

The example index.md file would go inside a folder called "New-Category" within the "Basic-Elements" folder. 

The menu section variables control where this page is provided in the left site menu. In this case as a sub-page of "Basic Elements". 

Each index file content should contain two lines "image-set" and "file-set", which call the respective plugins to list the images in this folder and then the foles which are not images in the same folder.
