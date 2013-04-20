## Jacket
### Dress appropriately

Jacket helps you orgainze stylesheets for a multi context build process.
Write and maintain a master stylesheet, then output custom tailored
stylesheets for specific devices, browsers, and builds.

### Usage

Write all code in your canonical stylesheet (style.scss):

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

Create a stylesheets for each build, and tell Jacket what the weather is.

style.ios.scss

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

style.android-2x.scss

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

style.android-2x.scss

```scss
// Set the weather 
$jacket: andr-2x;
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

style.scss

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

Or add wrapper selectors for a context, if that's your thing.

style.scss

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

*Inspired by [Breakpoint's](https://github.com/Team-Sass/breakpoint) breakpoint-context.*