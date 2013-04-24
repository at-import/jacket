## Jacket 
### Dress appropriately

Jacket is a Sass/Compass component that helps you orgainze stylesheets for a 
multi-context build process. Write and maintain a master stylesheet, then 
output custom tailored stylesheets for specific browsers, mobile/desktop sites, 
and app builds.

### Installation

**Wih Rubygems**

1. `gem install jacket`
2. Require the gem in your config.rb  
3. Import 'jacket' in your stylesheet.  

**With Bower**

1. `bower install jacket`  
2. Add `extensions_dir: "[your Bower component directory]"` to config.rb  
3. Import 'jacket' in your stylesheet.  

<small>*Ad-hoc imports are working in Compass 0.12.2, [but may be broken in 0.13.alpha](https://github.com/chriseppstein/compass/issues/1200)*</small>

### Basic Usage

Write and maintain your code in a canonical stylesheet.

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

// Compiled result
.rainy {
  font-size: 1rem;
  background-color: #c0ffee;
  content: 'Double ristretto cortado, stat.';
}
```

**style.android-2x.scss**

```scss
// Set the weather 
$jacket: andr-2x;
@import 'style';

// Compiled result
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
```


```scss
.rainy {
  font-size: 1rem;
  background-color: #000;
  content: 'Round three. FIGHT!';
}
```

Now use a build process, conditional comments, or some fancy scripting to give each environment a stylesheet cut just for them. Not too much, not too little. Those stylesheets are lookin' good.

### Advanced Usage

You can add a wrapping selector to a jacket context, if that's your thing. Make sure to surround your selector with quotes.

```scss
$jacket: ie8 '.ltie9';
@import 'style';

// Compiled result
.drizzle {
  font-size: 1rem;
}
.ltie9 .drizzle {
  background-color: #fcf;
  content: 'These are some beautiful prefixed rules.';
}
```

You can set multiple comma separated contexts in `$jacket`. If any context matches a value the jacket will be output.

```scss
$jacket: ios, andr-2x;
@import 'style';

// Compiled result
.rainy {
  font-size: 1rem;
  background-color: #c0ffee;
  content: 'Double ristretto cortado, stat.';
  background-color: #baddad;
  content: 'I should get a new phone.';
}
```

You can also set multiple values for a single jacket mixin. If a context matches any value, the jacket will be output.

```scss
.rainy {
  // Universal rules
  font-size: 1rem;

  @include jacket(ie6, ie7, ie8) {
    background-color: #ff0;
    content: 'Well this escalated quickly.';
  }
}
```
**style.ie8.scss**

```scss
$jacket: ie8;
@import 'style';

// Compiled result
.rainy {
  font-size: 1rem;
  background-color: #ff0;
  content: 'Well this escalated quickly.';
}
```

Complex jacket contexts like `$jacket: mdot, ie7 '.ltie9', ie8 'ltie9'` work just fine. For advanced usage including conditional logic and a media query fallback example mixin, [check out the tests](https://github.com/Team-Sass/jacket/blob/master/test/scss/style.scss).


### Todo

1. Better documentation, including `jacket-context()` function.
2. Remove `lib` and Compass dependencies when `list-separator()` lands in Sass.

<small>*Thanks to [Breakpoint](https://github.com/Team-Sass/breakpoint), who's no-query functionality inspired this project.*</small>