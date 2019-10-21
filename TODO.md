https://archive.org/compress/CAT_DATASET/formats=ZIP

https://evilmartians.com/chronicles/images-done-right-web-graphics-good-to-the-last-byte-optimization-techniques

https://pixabay.com/images/search/cat/?pagi=1
https://www.pexels.com/search/cat/?page=1

https://visualhunt.com/photos/cat/?page=1
https://unsplash.com/images/animals/cat = ???

(?after=ID)
https://www.reddit.com/r/cats/top/
https://www.reddit.com/r/kittens/top/

RipMe: https://github.com/ripmeapp/ripme

https://stackoverflow.com/questions/4196453/simple-and-fast-method-to-compare-images-for-similarity


https://github.com/lovell/sharp

```sql
CREATE TABLE users (
  ip varchar(255) PRIMARY KEY,
  trusted bool
);

CREATE TABLE votes (
  ip varchar(255) PRIMARY KEY,
  p1 int not null,
  p1_rating double not null,
  p2 int not null,
  p2_rating double not null,
  winner p1 | p2,
);

CREATE TABLE images (
  id INT PRIMARY KEY,
  hash varchar(255) not null,
  elo DOUBLE NOT NULL DEFAULT 1000,
  wins INT NOT NULL DEFAULT 0,
  losses INT NOT NULL DEFAULT 0,
);

CREATE INDEX ON ladder(elo);
```

- Need to move last image to fill gaps when one is deleted! (rename file as
  well)
```
mv last.jpg -> num.jpg
delete where id = num && update last.id = num
last--;
```

# TODO:

- add logic to shut down droplet before 1TB
- write script which scrapes (download in parallel) and cleans data:
  - resize to fit in 300x300
  - if png, turn into jpg with q:85%
  - mozjpg to pack
  - strip exif
  - create webp + jpg (fallback)
  - rename to number
- quality control
  - detectors:
    - NSFW (filter NSFW)
    - Humans (filter out images with humans)
    - Cats (filter out images with no real cats)
  - dedup (save hash in db)
  - display N=100 images per page and select which to delete or keep
- create sqlite database and write simple webserver
- add matchmaking logic - what is shown depends on IP (start with N highest vs,
  N lowest to see if user gets X% correct)
- add google analytics
- leaderboard to display N best and N worst
-   
