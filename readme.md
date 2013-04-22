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

*Note: Ad-hoc imports are working in Compass 0.12.2, [but may be broken in 0.13.alpha](https://github.com/chriseppstein/compass/issues/1200)*

### Usage

Write all code in a canonical stylesheet.

**style.scss**

```scss
.rainy {
  // Universal rules
  font-size: 1rem;
  width: 90%;
  
  // Styles for iOS only
  @include jacket(ios) {
    background-color: #c0ffee;
    content: 'Double ristretto cortado, stat.';
  }
  // Styles for Android 2.x only
  @include jacket(andr-2x) {
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

Then create stylesheets for each build, and tell Jacket what the weather is.

**style.ios.scss**

```scss
// Set the weather 
$jacket: ios;
@import 'style';

// Compiled result
.rainy {
  font-size: 1rem;
  width: 90%;
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
  width: 90%;
  background-color: #baddad;
  content: 'I should get a new phone.';
}
```

**style.ie.scss**

```scss
// Set the weather 
$jacket: ie8;
@import 'style';

// Compiled result
.rainy {
  font-size: 1rem;
  width: 90%;
  background-color: #000;
  content: 'Round three. FIGHT!';
}
```

You can set multiple comma separated contexts in `$jacket`.

**style.scss**

```scss
// Set the weather 
$jacket: ios, andr-2x;
@import 'style';

// Compiled result (bad example, but you get the idea)
.rainy {
  font-size: 1rem;
  width: 90%;
  background-color: #c0ffee;
  content: 'Double ristretto cortado, stat.';
  background-color: #baddad;
  content: 'I should get a new phone.';
}
```

Or output a context wrapped in selectors, if that's your thing.

**style.scss**

```scss
// Set the weather. Make sure to surround your selector with quotes.
$jacket: ie8 '.ltie9';
@import 'style';

// Compiled result
.rainy {
  font-size: 1rem;
  width: 90%;
}

.ltie9 .rainy {
  background-color: #000;
  content: 'Round three. FIGHT!';
}
```

Complex Jacket contexts like `$jacket: mdot, ie7 '.ltie9', ie8 'ltie9'` work just fine.

### Strut your stuff

Now use a build process, conditional comments, or some fancy scripting to give each of your chosen environments a stylesheet made just for them. Not too much, not too little. Those stylesheets are lookin' good.

### Todo

1. Better documentation, including `jacket-context()` function.
2. Remove `lib` and Compass dependencies when `list-separator()` lands in Sass.

<small>*Thanks to [Breakpoint](https://github.com/Team-Sass/breakpoint), who's no-query functionality inspired this project.*</small>