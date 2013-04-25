# Jacket 

**Dress your css appropriately.**

Jacket is a Sass/Compass component that helps you orgainze stylesheets for a 
multi-context build process. Write and maintain a master stylesheet, then 
output custom tailored stylesheets for specific browsers, mobile/desktop sites, and app builds.

## Installation

**With Ruby**

1. In Terminal: `gem install jacket`
2. Require the gem in your config.rb  
3. Import 'jacket' in your stylesheet.  

**With Bower**

1. In Terminal: `bower install jacket`  
2. Add `extensions_dir = "[your Bower component directory]"` to config.rb  
3. Import 'jacket' in your stylesheet.  

## Basic Usage

Write your code in a master stylesheet.

**style.scss**

```scss
.rainy {
  // Universal rules
  font-size: 1rem;
  
  // Styles for iOS only
  @include jacket(ios) {
    background-color: #c0ffee;
    content: 'Double ristretto cortado, stat.';
  }
  // Styles for Android 2.x only
  @include jacket(android-2x) {
    background-color: #baddad;
    content: 'I should get a new phone.';
  }
  // Styles for ie8 only
  @include jacket(ie8) {
    background-color: #000;
    content: 'Round three. FIGHT!';
  }
}
```

Then create a stylesheet for each build context, and tell Jacket what the weather is.

**style.ios.scss**

```scss
// Set the weather 
$jacket: ios;
@import 'style';

// Compiles to
.rainy {
  font-size: 1rem;
  background-color: #c0ffee;
  content: 'Double ristretto cortado, stat.';
}
```

**style.android-2x.scss**

```scss
// Set the weather 
$jacket: android-2x;
@import 'style';

// Compiles to
.rainy {
  font-size: 1rem;
  background-color: #baddad;
  content: 'I should get a new phone.';
}
```

**style.ie.scss**

```scss
// Set the weather 
$jacket: ie8;
@import 'style';

//Compiles to:
.rainy {
  font-size: 1rem;
  background-color: #000;
  content: 'Round three. FIGHT!';
}
```

Now use an automated build process, conditional comments, or some fancy scripting to give each of your chosen environments a stylesheet made just for them. Not too much, not too little. Those stylesheets are lookin' good.

## Advanced Usage

You want to take it to the next level? Yeah, we have another level you can take it to.

#### Wrapping selector

Add a wrapping selector to a jacket context. Make sure to surround the selector with quotes.

```scss
.drizzle {
  // universal styles
  @include jacket(mackintosh) {
    // mackintosh styles
  }
}
```

**style.mackintosh.scss**

```scss
$jacket: mackintosh '.mack';
@import 'style';

// Compiles to 
.drizzle {
  // universal styles
}
.mack .drizzle {
  // mackintosh styles
}
```

#### Multiple contexts in one stylesheet

Set multiple comma separated contexts in `$jacket`. If any context matches a value that jacket will be output.

```scss
.thunderstorm {
  // universal styles
  @include jacket(anorak) {
    // anorak styles
  }
  @include jacket(windbreaker) {
    // windbreaker styles
  }
}
```

**style.wetandcold.scss**

```scss
$jacket: anorak, windbreaker;
@import 'style';

// Compiles to
.thunderstorm {
  // universal styles
  // anorak styles
  // windbreaker styles
}
```

#### Jackets that match multiple contexts

Set multiple values for a single jacket mixin. If a context matches any value, the jacket will be output.

```scss
.soiree {
  // universal styles
  @include jacket(suit, coat, tie) {
    // styles that should be used with any suit, coat, or tie
  }
}
```
**style.tie.scss**

```scss
$jacket: tie;
@import 'style';

// Compiled result
.soiree {
  // universal styles
  // styles that should be used with any suit, coat, or tie
}
```

#### And more...

Check out the [tests](https://github.com/Team-Sass/jacket/tree/master/test) for more examples, including condtional logic with nested jackets and a simple media query fallback mixin.

## Todo

1. Document `jacket-context()` function.
2. Set up automated testing framework.
4. Remove `lib` and Compass dependencies when `list-separator()` lands in Sass.

<small>*Thanks to [Breakpoint](https://github.com/Team-Sass/breakpoint), who's no-query functionality inspired this project.*</small>
