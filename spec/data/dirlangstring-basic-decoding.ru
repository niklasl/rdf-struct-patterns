DELETE {
  ?s ?p ?litnode .
  ?litnode a rdf:CompoundLiteral ;
    rdf:language ?lang ;
    rdf:direction ?langdir .
}
INSERT {
  ?s ?p ?strlangdir .
}
WHERE {
  ?s ?p ?litnode .
  ?litnode a rdf:CompoundLiteral ;
    rdf:language ?lang ;
    rdf:direction ?langdir .

  BIND(STRLANGDIR(STR(?lexical), ?lang, ?langdir) as ?strlangdir)
}
