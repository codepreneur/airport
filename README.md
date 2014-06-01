Airport
=======



I have controllers sending planes from one airport to another (and also adding freshly manufactured ones if needed) and I have a little engine built-in where if the airport is full for example, planes keep asking whether its still full and wait in the queue until they can get in. Similarly with with weather.

For example, a controller sends a plane of your choice from airport of your choice to another airport of your choice (using sky as a temporary location (not a placeholder/container), but if at any given point in time of this cycle plane cant get what it wants (cause airport is full or storm started in the middle of the flight so it cant land yet), plane keeps asking whether storm is over (or whether airport is not full anymore). Which means I had to avoid Exceptions altogether :)

One thing I still need to figure out is how to make airport and other classes private so user can only use controller classes to run/play with this airport, as opposed to messing with internals :)

How to use it
-------------

Easiest way is to `require './lib/init' inside of `irb` which will provide you with initial components to play with:

```ruby
@plane1
@plane2
@plane3
@plane4
@luton
@heathrow
@gatwick
@sky
@controller
```

and then

```
@controller.add_plane_to(@luton,@plane1)
```

to add freshly manufactured plane to airport of your choice.
If you want to send planes to different airports, just use:

```
@controller.send_plane(from_airport,plane,sky,to_airport)
```

so with the components above it would look like this:

```
@controller.send_plane(@luton,@plane1,@sky,@gatwick)
```




