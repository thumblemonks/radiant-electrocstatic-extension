# Electrostatic

I ask, "Do you like Radiant?"

You say, *"Hell, yes!"*

I ask, *"Do you like having a redundant CMS in development and in production?"*

At least I say - but you probably say - *"Hell, no!"*

I ask, "Would you rather create a static bundle of HTML, images, JS, CSS, etc. and deploy that to production?"

You say, *"=D"*

## What is it?

Electrostatic is a very simple Radiant extension focused on generating truly static content from the Pages in your instance of the CMS. By truly static, I mean that an HTML, CSS, JS, or whatever type of content you have stored as a Page is rendered and then subsequently stored in a temporary directory.

Electrostatic determines file type simply. If the Page's slug has an extension - like: mystuff.js, styles.css, something.doc, etc. - that Page is rendered and stored in a file on the filesystem of the same name. If the Page's slug has no extension - like: about\_us, features, etc. - Electrostatic will make the slug a directory name and then render the Page into a file name index.html under the directory matching the Page's slug.

Additionally, Electrostatic maintains the structure of directories as you have defined them in the Pages section. Thus, if you have nested Pages, they will be represented correctly on the file system.

As an example, if you had a hierarchy of Page slugs matching the following:

    /
      |- features
        |- fame
        |- fortune
      |- plans
      |- javascripts    # Status of "Hidden"
        |- common.js
      |- stylesheets
        |- common.css
        |- plans.css

Electrostatic would generate a structure of directories and files like so:

    index.html
      |- features
        |- index.html
        |- fame
          |- index.html
        |- fortune
          |- index.html
      |- plans
         |- index.html
      |- javascripts
        |- common.js
      |- stylesheets
        |- index.html    # This is true because stylesheets does not have a "Hidden" status
        |- common.css
        |- plans.css

After generating the rendered pages, Electrostatic will copy in the contents of your `public` directory. In theory, doing this will create a stand-alone directory of your static content. The purpose of all of this work is to create an exact representation of your content as static and navigable web content, once it is hosted properly behind a web server.

Why would I do this? See your dialogue above? I only want one canonical source for my CMS, but I also do not want the content being changed directly in production.

You should know that Electrostatic will only render those Pages you have marked as "Published". So if you you're not getting a Page that you expect, perhaps it's not marked as "Published".

## How do I install it?

Electrostatic is installed like any other Radiant extension:

    ./script/extension install electrostatic

## How do I use it?

Once installed, from the command line you run:

    rake electrostatic:build

This will put everything in your app's local `tmp/electrostatic-TIMESTAMP` directory. It will also create a bzip compressed tarball of that directory named `electrostatic-TIMESTAMP.tar.bz2`. You can do whatever you like with this file or the directory. The idea is to take it and put it in your production system as the content to be hosted.

## TODO

* Make the compression more flexible (as in, support Windows users)
* Things suggested by others

## License

Copyright &copy; 2009 Justin Knowlden, Thumble Monks; released under the MIT license
