var mdoc = require('mdoc');

mdoc.run({

    // === required settings === //

    inputDir : 'src',
    outputDir : 'doc',

    // === optional settings === //

    baseTitle : 'meteor-imgur documentation',
    indexContentPath : 'src/index.md'

});