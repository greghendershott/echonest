This provides Racket wrapper functions around version 4 of
[The Echo Nest API][].

> **NOTE:** This is version 0.1 quality. I haven't yet had time to use
> it extensively in real applications. If you have any problems, please
> either log an issue here or please submit a pull request. Thank you.

# Install

    $ raco pkg install echonest

You may be prompted to install a couple other packages.

# Configure

You will need to get an Echo Nest API key and put it in
`~/.echonest-api-key`:

    API Key=ASDFASDFASDFASDF

# Quick Check

A quick check that you installed and configured OK:

```racket
#lang racket
(require echonest)
(artist-list-genres)
```

Should print JSON (as represented by Racket's `json` module) something
like this:

```racket
'#hasheq((response
          .
          #hasheq((status
                   .
                   #hasheq((version . "4.2") (code . 0) (message . "Success")))
                  (genres
                   .
                   (#hasheq((name . "a cappella"))
                    #hasheq((name . "abstract hip hop"))
                    #hasheq((name . "acid house"))
                    #hasheq((name . "acid jazz"))
                    #hasheq((name . "acousmatic"))
                    #hasheq((name . "acoustic blues"))
                    #hasheq((name . "acoustic pop"))
                    #hasheq((name . "african percussion"))
                    #hasheq((name . "african rock"))
                    #hasheq((name . "afrobeat"))
                    #hasheq((name . "afrobeats"))
                    #hasheq((name . "aggrotech"))
                    #hasheq((name . "albanian pop"))
...
```

You can use `#lang rackjure`'s threading macros and applicable
`dict`s to make it easier to work with JSON:

```racket
#lang rackjure
(require echonest)
(~>> (artist-list-genres) 'response 'genres ;genres list of hashes
     (map hash-values)                      ;just the hashes' values
     append*)                               ;((a) (b) ...) => (a b ...)
```

Result:

```racket
'("a cappella"
  "abstract hip hop"
  "acid house"
  "acid jazz"
  "acousmatic"
  "acoustic blues"
  "acoustic pop"
  "african percussion"
  "african rock"
  "afrobeat"
  "afrobeats"
  "aggrotech"
  "albanian pop"
  ... )
 ```

# Usage

This library uses [wffi][]. As a result, the actual Racket code is
tiny. The actual payload is a Markdown format file describing each API
resource, from each of which a Racket wrapper function is generated.

A wffi Markdown file uses a "literate programming" style where a web
API's documentation _is_ its specification. For example:

    # Catalog Play
    ## Request
    ````
    GET /catalog/play
        ?api_key={}
        &format=json
        &id={}
        &item={}
        &[plays={}]
    ````

This describes a web API resource. It results in the definition of a
Racket function `catalog-play`. You should call it with the required
parameters `id` and `item`. The `plays` parameter is in brackets,
meaning that it is optional.

```racket
(catalog-play 'id "ASDFASDFASDF" 'item "ASDFASDFADS")
(catalog-play 'id "ASDFASDFASDF" 'item "ASDFASDFADS" 'plays 10)
```

What about the required parameter `api_key`? Although it is required
by The Echo Nest API, this library supplies it for you automatically.

What's the deal with `format=json`? This library wants/expects only
JSON responses from The Echo Nest. So the `json` value is a constant
hardcoded in the definition file; that way you don't have to supply
it.

> **NOTE**: I didn't copy and paste all of The Echo Nest documentation
> into this file. You'll need to see [The Echo Nest API][] for
> that. In other words, this library is using wffi not for the full
> literal spec-is-documentation, but rather just for the spec part.

# Examples

See the unit tests in `test.rkt` for an example of calling each API
function using this library.

See [The Echo Nest API][] for details on the acceptable values, and
various specific usage examples (in curl style).


[The Echo Nest API]: http://developer.echonest.com/docs/v4
[wffi]: https://github.com/greghendershott/wffi
