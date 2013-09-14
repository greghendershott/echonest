# EchoNest

See https://developer.echonest.com/tutorial-overview.html and
http://developer.echonest.com/docs/v4/index.html

Endpoint: http://developer.echonest.com/api/v4

----------------------------------------------------------------------

# Artist Biographies
## Request
````
GET /artist/biographies
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
    [license={}]
````

# Artist Blogs
## Request
````
GET /artist/blogs
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
    [high_relevance={}]
````

# Artist Familiarity

Get our numerical estimation of how familiar an artist currently is to
the world.

## Request
````
GET /artist/familiarity
    ?api_key={}
    format=json
    [id={}]
    [name={}]
````

# Artist Hotttnesss

Returns our numerical description of how hottt an artist currently is.

## Request
````
GET /artist/hotttnesss
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [type={}]
````

`type` controls the type of hotttnesss that is used. May be
`"overall"` (default), `"social"`, `"reviews"`, or `"mainstream"`.

# Artist Images
## Request
````
GET /artist/images
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
    [license={}]
````


# Artist List Genres

Get a list of the available genres for use with `Artist Search` and
`playlisting`. This method returns a list of genres suitable for use
in the artist/search call when searching by description and for the
creation of genre-radio playlists. The returned list of genres is
inclusive of all supported genres.

## Request
````
GET /artist/list_genres
    ?api_key={}
    format=json
````    

# Artist List Terms

Get a list of the best typed descriptive terms for use with `Arist
Search`. This method returns a list of descriptive terms suitable for
use in the artist/search call when searching by description. The
returned list of terms is not necessarily inclusive of all supported
terms, but does include terms that are known to return high quality
results.

## Request
````
GET /artist/list_terms
    ?api_key={}
    format=json
    [type={}]
````    

`type` is `style` (default) or `mood`.

# Artist News
## Request
````
GET /artist/news
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
    [high_relevance={}]
````    

# Artist Profile
## Request
````
GET /artist/profile
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [bucket={}]
````    

`bucket` indicates what data should be returned with each artist. May
be `biographies`, `blogs`, `doc_counts`, `familiarity`, `hotttnesss`,
`images`, `artist_location`, `news`, `reviews`, `songs`, `terms`,
`urls`, `video`, `years_active`, or `id:Rosetta-space`.

# Artist Reviews
## Request
````
GET /artist/reviews
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
````    

# Artist Search
## Request
````
GET /artist/search
    ?api_key={}
    format=json
    [bucket={}]
    [limit={}]
    [artist_location={}]
    [name={}]
    [description={}]
    [genre={}]
    [style={}]
    [mood={}]
    [rank_type={}]
    [fuzzy_match={}]
    [max_familiarity={}]
    [min_familiarity={}]
    [max_hottness={}]
    [min_hottness={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [sort={}]
    [results={}]
    [start={}]
````

# Artist Songs
## Request
````
GET /artist/songs
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
````

# Artist Similar
## Request
````
GET /artist/similar
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [bucket={}]
    [limit={}]
    [max_familiarity={}]
    [min_familiarity={}]
    [max_hottness={}]
    [min_hottness={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [sort={}]
    [limit={}]
    [seed_catalog={}]
    [results={}]
    [start={}]
````

# Artist Suggest
## Request
````
GET /artist/suggest
    ?api_key={}
    format=json
    [name={}]
    [q={}]
    [results={}]
````

# Artist Terms
## Request
````
GET /artist/terms
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [sort={}]
````

# Artist Top Terms
Returns a list of the overall top terms.
## Request
````
GET /artist/top_terms
    ?api_key={}
    format=json
    [results={}]
````

# Artist Twitter
Gets the twitter handle for an artist.
## Request
````
GET /artist/twitter
    ?api_key={}
    format=json
    [id={}]
    [name={}]
````

# Artist URLs

Get links to the artist's official site, MusicBrainz site, MySpace
site, Wikipedia article, Amazon list, and iTunes page.

## Request
````
GET /artist/urls
    ?api_key={}
    format=json
    [id={}]
    [name={}]
````

# Artist Video
Get a list of video documents found on the web related to an artist.
## Request
````
GET /artist/video
    ?api_key={}
    format=json
    [id={}]
    [name={}]
    [results={}]
    [start={}]
````

----------------------------------------------------------------------

# Song Search
## Request
````
GET /song/search
    ?api_key={}
    format=json
    [title={}]
    [artist={}]
    [combined={}]
    [description={}]
    [style={}]
    [mood={}]
    [rank_type={}]
    [artist_id={}]
    [results={}]
    [start={}]
    [song_type={}]
    [max_tempo={}]
    [min_tempo={}]
    [max_duration={}]
    [min_duration={}]
    [max_loudness={}]
    [min_loudness={}]
    [artist_max_familiarity={}]
    [artist_min_familiarity={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [song_max_hotttnesss={}]
    [song_min_hotttnesss={}]
    [min_longitude={}]
    [max_longitude={}]
    [min_latitude={}]
    [max_latitude={}]
    [max_danceability={}]
    [min_danceability={}]
    [max_energy={}]
    [min_energy={}]
    [max_liveness={}]
    [min_liveness={}]
    [max_speechiness={}]
    [min_speechiness={}]
    [max_acousticness={}]
    [min_acousticness={}]
    [mode={}]
    [key={}]
    [bucket={}]
    [sort={}]
    [limit={}]
````

# Song Profile
## Request
````
GET /song/profile
    ?api_key={}
    format=json
    id={}
    [track_id={}]
    [bucket={}]
    [limit={}]
````

# Song Identify
## Request
````
GET /song/identify
    ?api_key={}
    format=json
    [query={}]
    [code={}]
    [artist={}]
    [title={}]
    [release={}]
    [duration={}]
    [genre={}]
    [version={}]
    [bucket={}]
````

----------------------------------------------------------------------

# Track Profile
## Request
````
GET /track/profile
    ?api_key={}
    format=json
    [id={}]
    [md5={}]
    [bucket={}]
````

# Track Upload URL
## Request
````
GET /track/upload
    ?api_key={}
    format=json
    url={}
````

# Track Upload File
## Request
````
POST /track/upload
    ?api_key={}
    format=json
    filetype={}
Content-Type: application/octet-stream
Content-Length: {}
[Expect: {}]
````

----------------------------------------------------------------------

# Playlist Basic
## Request
````
GET /playlist/basic
    ?api_key={}
    format=json
    [type={}]
    [artist_id={}]
    [artist={}]
    [song_id={}]
    [genre={}]
    [track_id={}]
    [results={}]
    [bucket={}]
    [limit={}]
    [dcma={}]
````


# Playlist Static
## Request
````
GET /playlist/static
    ?api_key={}
    format=json
    [type={}]
    [artist_pick={}]
    [variety={}]
    [distribution={}]
    [adventurousness={}]
    [artist_id={}]
    [artist={}]
    [song_id={}]
    [track_id={}]
    [description={}]
    [genre={}]
    [style={}]
    [mood={}]
    [results={}]
    [max_tempo={}]
    [min_tempo={}]
    [max_duration={}]
    [min_duration={}]
    [max_loudness={}]
    [min_loudness={}]
    [max_danceability={}]
    [min_danceability={}]
    [max_energy={}]
    [min_energy={}]
    [max_liveness={}]
    [min_liveness={}]
    [max_speechiness={}]
    [min_speechiness={}]
    [min_acousticness={}]
    [max_acousticness={}]
    [artist_max_familiarity={}]
    [artist_min_familiarity={}]
    [artist_max_hotttnesss={}]
    [artist_min_hotttnesss={}]
    [song_type={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [song_max_hotttnesss={}]
    [song_min_hotttnesss={}]
    [min_longitude={}]
    [max_longitude={}]
    [min_latitude={}]
    [max_latitude={}]
    [mode={}]
    [key={}]
    [bucket={}]
    [sort={}]
    [limit={}]
    [dcma={}]
````

# Playlist Dynamic Create
## Request
````
GET /playlist/dynamic/create
    ?api_key={}
    format=json
    [type={}]
    [artist_pick={}]
    [variety={}]
    [distribution={}]
    [adventurousness={}]
    [artist_id={}]
    [artist={}]
    [song_id={}]
    [track_id={}]
    [description={}]
    [genre={}]
    [style={}]
    [mood={}]
    [max_tempo={}]
    [min_tempo={}]
    [max_duration={}]
    [min_duration={}]
    [max_loudness={}]
    [min_loudness={}]
    [max_danceability={}]
    [min_danceability={}]
    [max_energy={}]
    [min_energy={}]
    [max_liveness={}]
    [min_liveness={}]
    [max_speechiness={}]
    [min_speechiness={}]
    [min_acousticness={}]
    [max_acousticness={}]
    [artist_max_familiarity={}]
    [artist_min_familiarity={}]
    [artist_max_hotttnesss={}]
    [artist_min_hotttnesss={}]
    [song_type={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [song_max_hotttnesss={}]
    [song_min_hotttnesss={}]
    [min_longitude={}]
    [max_longitude={}]
    [min_latitude={}]
    [max_latitude={}]
    [mode={}]
    [key={}]
    [bucket={}]
    [sort={}]
    [limit={}]
    [dcma={}]
    [session_catalog={}]
````

# Playlist Dynamic Restart
## Request
````
GET /playlist/dynamic/restart
    ?api_key={}
    format=json
    [type={}]
    [artist_pick={}]
    [variety={}]
    [distribution={}]
    [adventurousness={}]
    [artist_id={}]
    [artist={}]
    [song_id={}]
    [track_id={}]
    [description={}]
    [genre={}]
    [style={}]
    [mood={}]
    [max_tempo={}]
    [min_tempo={}]
    [max_duration={}]
    [min_duration={}]
    [max_loudness={}]
    [min_loudness={}]
    [max_danceability={}]
    [min_danceability={}]
    [max_energy={}]
    [min_energy={}]
    [max_liveness={}]
    [min_liveness={}]
    [max_speechiness={}]
    [min_speechiness={}]
    [min_acousticness={}]
    [max_acousticness={}]
    [artist_max_familiarity={}]
    [artist_min_familiarity={}]
    [artist_max_hotttnesss={}]
    [artist_min_hotttnesss={}]
    [song_type={}]
    [artist_start_year_before={}]
    [artist_start_year_after={}]
    [artist_end_year_before={}]
    [artist_end_year_after={}]
    [song_max_hotttnesss={}]
    [song_min_hotttnesss={}]
    [min_longitude={}]
    [max_longitude={}]
    [min_latitude={}]
    [max_latitude={}]
    [mode={}]
    [key={}]
    [bucket={}]
    [sort={}]
    [limit={}]
    [dcma={}]
    [session_catalog={}]
    session_id={}
````

# Playlist Dynamic Next
## Request
````
GET /playlist/dynamic/next
    ?api_key={}
    format=json
    session_id={}
    [results={}]
    [lookahead={}]
````

# Playlist Dynamic Feedback
## Request
````
GET /playlist/dynamic/feedback
    ?api_key={}
    format=json
    session_id={}
    [ban_artist={}]
    [favorite_artist={}]
    [ban_song={}]
    [skip_song={}]
    [favorite_song={}]
    [play_song={}]
    [unplay_song={}]
    [rate_song={}]
    [update_catalog={}]
    [invalidate_song={}]
    [invalidate_artist={}]
````

# Playlist Dynamic Steer
## Request
````
GET /playlist/dynamic/steer
    ?api_key={}
    format=json
    session_id={}
    [min_xxx={}]
    [max_xxx={}]
    [target_xxx={}]
    [more_like_this={}]
    [less_like_this={}]
    [adventurousness={}]
    [variety={}]
    [description={}]
    [style={}]
    [song_type={}]
    [mood={}]
    [reset={}]
````

# Playlist Dynamic Info
## Request
````
GET /playlist/dynamic/info
    ?api_key={}
    format=json
    session_id={}
````

# Playlist Dynamic Delete
## Request
````
GET /playlist/dynamic/delete
    ?api_key={}
    format=json
    session_id={}
````

----------------------------------------------------------------------

# Catalog Create
## Request
````
POST /catalog/create
    ?api_key={}
    format=json
    name={}
    type={}
Content-Type: application/x-www-form-urlencoded
````

# Catalog Update
## Request
````
POST /catalog/update
    ?api_key={}
    format=json
    id={}
    data_type=json
    data={}
Content-Type: application/x-www-form-urlencoded
````

# Catalog Keyvalues
## Request
````
GET /catalog/keyvalues
    ?api_key={}
    format=json
    id={}
````

# Catalog Play
## Request
````
GET /catalog/play
    ?api_key={}
    format=json
    id={}
    item={}
    [plays={}]
````

# Catalog Skip
## Request
````
GET /catalog/skip
    ?api_key={}
    format=json
    id={}
    item={}
    [skips={}]
````

# Catalog Favorite
## Request
````
GET /catalog/favorite
    ?api_key={}
    format=json
    id={}
    item={}
    [favorite={}]
````

# Catalog Ban
## Request
````
GET /catalog/ban
    ?api_key={}
    format=json
    id={}
    item={}
    [ban={}]
````

# Catalog Rate
## Request
````
GET /catalog/rate
    ?api_key={}
    format=json
    id={}
    item={}
    [rating={}]
````

# Catalog Status
## Request
````
GET /catalog/status
    ?api_key={}
    format=json
    ticket={}
````

# Catalog Profile
## Request
````
GET /catalog/profile
    ?api_key={}
    format=json
    [id={}]
    [name={}]
````

# Catalog Read
## Request
````
GET /catalog/read
    ?api_key={}
    format=json
    id={}
    [item_id={}]
    [bucket={}]
    [results={}]
    [start={}]
````

# Catalog Feed
## Request
````
GET /catalog/feed
    ?api_key={}
    format=json
    id={}
    [item_id={}]
    [bucket={}]
    [results={}]
    [start={}]
    [since={}]
    [high_relevance={}]
````

# Catalog Delete
## Request
````
POST /catalog/delete
    ?api_key={}
    format=json
    id={}
Content-Type: application/x-www-form-urlencoded
````

# Catalog List
## Request
````
GET /catalog/list
    ?api_key={}
    format=json
    [results={}]
    [start={}]
````

# Catalog Similar
## Request
````
GET /catalog/similar
    ?api_key={}
    format=json
    id={}
    [results={}]
    [start={}]
    [keyvalue={}]
````

# Catalog Predict
## Request
````
GET /catalog/predict
    ?api_key={}
    format=json
    id={}
    category={}
````

----------------------------------------------------------------------

