var wordVecs={};
var word1="cat"
var word2="dog"
var v1;
var v2;
function setup(){
loadJSON('data/wordvecs10000.json', (data) => {
    wordVecs = data.vectors;
    console.log('loaded');
});
setTimeout(getwords,3000);
}
function getwords(){
v1=wordVecs[word1];
v2=wordVecs[word2];
if (!v1) {
      console.log("No word vector for first word");
      return;
    }
    if (!v2) {
      console.log("No word vector for second word");
      return;
    }
	let average = Word2Vec.average(v1, v2);
	let output = findNearest(average);
	console.log(output);
}
function findNearest(word, n=10) {
  let nearest = Word2Vec.nearest(word, 10);
  if (!nearest) {
    return 'No word vector found';
  }
  let output = '';
  for (let i = 0; i < nearest.length; i++) {
    output += nearest[i].word + ' ';
  }
  return output;
}  
