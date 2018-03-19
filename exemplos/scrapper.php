<?php
libxml_use_internal_errors(TRUE); // avoid messages about HTML ill-formed

function connect($url) {
    return file_get_contents($url, false, stream_context_create(['http' => ['method'=>'get']]));
}

function parser($page) {    
    $doc = DomDocument::loadHTML($page);
    $xpath = new DOMXPath($doc);
    $els = $xpath->query('//a'); 
    $total_els = $els->length; 
    foreach($els as $index => $el){
        if (strpos($el->attributes->getNamedItem('href')->textContent,'?id') !== false) {
            $page = connect('http://www.coloring-book.info/coloring/' . $el->attributes->getNamedItem('href')->textContent);
            $doc->loadHTML($page);
            $xpath = new DomXPath($doc);
            $dir_image = $xpath->query("//img[contains(@class,'print')]")[0]->getAttribute('src');
            

            $directory = explode('/',$dir_image)[0];            

            if (!file_exists(__DIR__ . DIRECTORY_SEPARATOR . $directory)){
                mkdir(__DIR__ . DIRECTORY_SEPARATOR . $directory);
            }

            echo "Saving $index / $total_els\n";
            file_put_contents(__DIR__ .  DIRECTORY_SEPARATOR . $dir_image, connect('http://www.coloring-book.info/coloring/' . $dir_image));
        }  
    } 
}

function run()
{
    $url = 'http://www.coloring-book.info/coloring/';
    $doc = DomDocument::loadHTML(connect($url));
    $xpath = new DOMXPath($doc);
    $links = $xpath->query('//center/a'); 

    foreach($links as $link){
        if ($link->textContent != '') {
            echo 'Scrapping: ' . $link->textContent;
            $page = connect($url + $link->attributes->getNamedItem('href'));
            parser($page);
        }
    }		
}
