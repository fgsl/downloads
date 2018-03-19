<?php
$url = 'http://www.imdb.com/search/title?release_date=2017&sort=num_votes,desc&page=1';

$response = file_get_contents($url, false, stream_context_create(['http' => ['method' => 'get']]));

echo substr($response,0, 500);


