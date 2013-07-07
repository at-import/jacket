# Jacket 

**Conditional Styles with Sass. Dress you CSS appropriately.**

Jacket is a Compass component that prints and hides styles based on context variables you set in your stylesheet. Write and maintain a master stylesheet, then output custom tailored stylesheets for modern and legacy browsers, site and app builds, or any other context you can think of.

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

Use the jacket mixin to conditionally output blocks of code. If any context matches a context in the `$jacket` variable, your conditional code will be output. If the context has a wrapping selector associated with it, the code block will be wrapped in the wrapping selector.

```scss
jacket($contexts...) {
  // Conditional code
}
```

### The jacket() function

Use the jacket function to conditionally output values. If any context matches a context in the `$jacket` variable, the value will be output.

```scss
property: jacket($value, $contexts...);
```

### The $jacket variable

Use the `$jacket` variable to set a stylesheet's context. Each context can have an optional wrapping selector.

```
$jacket: context, context '.wrapping-selector', context;
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

Add context specific code wrapped in the jacket mixin or the jacket function. If any jacket mixin context matches a value in the `$jacket` variable, the code will be output.

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
$jacket: ie8 '.ie8';
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

Now you can serve these custom tailored stylesheets to the correct context with conditional comments, an automated build process, or some javascript. Not too much, not too little. Those stylesheets are lookin' good.

## Advanced Usage

Check out the [tests](https://github.com/Team-Sass/jacket/tree/master/test) for more examples, including condtional logic with nested jackets and a simple media query fallback mixin.



<small>*Thanks to [Breakpoint](https://github.com/Team-Sass/breakpoint), who's no-query functionality inspired this project.*</small>
