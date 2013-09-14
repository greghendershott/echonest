This provides Racket wrapper functions around the
[The Echo Nest API](http://developer.echonest.com/).

> **NOTE:** This is version 0.1 quality. I haven't yet had time to use
> it extensively in real applications. If you have any problems, please
> either log an issue here or please submit a pull request. Thank you.

# Install

```sh
$ raco pkg install echonest
```

You may be prompted to install a couple other packages.

# Configure

You will need to get an Echo Nest API key and put it in
`~/.echonest-api-key`:

```sh
API Key=ASDFASDFASDFASDF
```

# Usage

See `echonest.md` for the list of functions. See `test.rkt` for an
example of calling each one (as part of the unit tests).

# Implementation

This uses [wffi]. As a result, the actual Racket code is tiny. The
bulk of is a Markdown format file describing each API, from which each
Racket wrapper function is generated.
