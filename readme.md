# Jacket 

**Conditional Styles with Sass. Dress your CSS appropriately.**

Jacket is a Compass component that prints or hides styles based on context variables you set in your stylesheet. Write and maintain a master stylesheet, then output custom tailored stylesheets for modern and legacy browsers, site and app builds, or any other context you can think of.

## Installation

Until Sass 3.3 is released Jacket requires Compass.

**With Ruby**

1. In Terminal: `gem install jacket`
2. Require the gem in your config.rb  
3. Import 'jacket' in your stylesheet.  

**With Bower**

1. In Terminal: `bower install jacket`  
2. Add `extensions_dir = "[your Bower component directory]"` to config.rb  
3. Import 'jacket' in your stylesheet.  

## Basic Usage

### The jacket() mixin

Use the jacket mixin to conditionally output blocks of code. If any context in the jacket mixin matches a context in the `$jacket` variable, your conditional code will be output. To submit more than one context to the jacket mixin, they have to be seperated by comma. If the `$jacket` variable context has a wrapping selector associated with it, the code block will be wrapped in the wrapping selector.

```scss
jacket($contexts...) {
  // Conditional code
}
```

### The jacket() function

Use the jacket function to conditionally output values. If any context in the jacket function matches a context in the `$jacket` variable, the value will be output. To submit more than one context to the jacket function, they have to be seperated by comma. If none of the submitted contexts matches a context in the `$jacket` variable, the jacket function will return null.

```scss
property: jacket($value, $contexts...);
```

### The jacket-else() function

This function is similar to the jacket() function. In contrast to the jacket() function, jacket-else() will return an else value if none of the submitted contexts matches a context in the `$jacket` variable. In case of a match, it will return the value like the jacket() function. To submit more than one context to the jacket-else function, they have to be seperated by comma.

```scss
property: jacket-else($value, $else, $contexts...);
```

### The $jacket variable

Use the `$jacket` variable to set a stylesheet's context. You can set multiple contexts in a comma separated list. Each context can have an optional wrapping selector associated with it. The wrapping selector has to be seperated from the context by space. 

```
$jacket: context, context '.wrapping-selector', context;
```

## The jacket-add-contexts() function

Instead of manipulating the `$jacket` variable by hand, you can use this tool.
It is no poblem to define the `$jacket` variable once and keep it that way. But if you are in the need to add contexts to the `$jacket` variable at different places in your code, you have to be verry careful to not destroy the structure of the list of the `$jacket` variable.
`jacket-add-contexts()` will do that for you. It will add the new contexts to the list. The new list will be retruned by the function. It also adds the new contexts to the `$jacket` variable globally. So it is not necessary that you assign the return value to the `$jacket` variable, but if you do, it will do no harm.
Contexts have to be seperated by comma, wrapping selector associated have to be seperated from their context by space.

```
$var:jacket-add-contexts(context1); 
$var:jacket-add-contexts(context2 wrapper2, context3);     
$jacket:jacket-add-contexts(context4, context5);
$jacket:jacket-add-contexts(context6 wrapper6, context7 wrapper7);
@debug jacket-add-contexts(do, what, erver you, want);  
```

### Examples

Write your code in a master stylesheet.

**style.scss**

```scss
.example {
  // Universal rules
  font-size: 1rem;
  padding:0 20px;
}
```

Wrap context specific code in the jacket mixin or the jacket function.

```scss
.example {
  // Universal rules
  font-size: 1rem;
  padding:0 20px;

  // Conditional styles for an ie8 stylesheet
  @include jacket(ie8) {
    float: left;
  }

  // Conditional styles for an iOS and android app build of the stylesheet
  @include jacket(ios, android) {
    background-color: #c0ffee;
  }

  line-height: jacket(1.5, ios, site) jacket(1.3, android);
}
```

Then create a stylesheet for each build context, and tell Jacket what the weather is.

**style.ios.scss**

```scss
$jacket: ios;
@import 'style';

// Compiles to
.example {
  font-size: 1rem;
  padding: 0 20px;
  background-color: #c0ffee;
  line-height: 1.5;
}
```

**style.android.scss**

```scss
// Set the weather 
$jacket: android;
@import 'style';

// Compiles to
.example {
  font-size: 1rem;
  padding: 0 20px;
  background-color: #c0ffee;
  line-height: 1.3;
}
```

**style.ie8.scss**

```scss
$jacket: legacy, ie8 '.ie8';
@import 'style';

//Compiles to:
.example {
  font-size: 1rem;
  padding: 0 20px;
}
.ie8 .example {
  float: left;
}
```

Now you can serve these custom tailored stylesheets to the correct context with conditional comments, an automated build process, or some javascript. Not too much, not too little. Your stylesheets are lookin' good.

## Advanced Usage

Check out the [tests](https://github.com/Team-Sass/jacket/tree/master/test) for more examples, including condtional logic with nested jackets and a simple media query fallback mixin.

## Contribute

Report bugs and feature proposals in the [Github issue tracker](https://github.com/Team-Sass/jacket/issues). In lieu of a formal styleguide, take care to maintain the existing coding style. 

## Release History

0.1.4, July 7, 2013: Add jacket() function, rewrite docs and tests.  
0.1.0, April 21, 2013: Initial release.

## License

[BSD-NEW](http://en.wikipedia.org/wiki/BSD_License)

<small>*Thanks to [Breakpoint](https://github.com/Team-Sass/breakpoint), who's no-query functionality inspired this project.*</small>
