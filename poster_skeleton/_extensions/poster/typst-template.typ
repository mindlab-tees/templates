
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates


#let poster(

// set defaults
  title: none,
  header_left: "images/mindlab.png",
  header_right: "images/tu.png",
  header_bg_color: none,
  header_text_color: "99999",
  subtitle: none,
  authors: none,

  title_text_size: 80pt,
  title_color: "ffffff",
  author_text_size: 32pt,

  footer_left: none,
  footer_right: none,
  footer_center: none,
  footer_bg_color: none,
  footer_text_color: "ffffff",
  
  cols: 3,
  width: 841mm,
  height:594mm,
  lang: "en",
  region: "UK",
  font: "Lexica Ultralegible",
  
  fontsize: 28pt,
 
  heading-family: "Lexica Ultralegible",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  doc,
) = {
  set page(
    width: width,
    height: height,
    margin:  (x: 0cm, top: 12cm),
    
    
    footer: if (footer_left != none or footer_center != none or footer_right != none) {
    // This block defines the content and appearance of the footer region
    block(
      width: 100%,
      height: 3cm,
      below: 1cm,
      inset: 1cm,
      fill: rgb(footer_bg_color), // Background color from YAML
      text(fill: rgb(footer_text_color), font: "Liberation Mono")[ // Text color from YAML
        #grid( // Grid for left/center/right layout
          columns: (1fr, auto, 1fr),
          align(left)[#footer_left],     // Left content from YAML
          align(center)[#footer_center], // Center content from YAML
          align(right)[#footer_right],   // Right content from YAML
        )
      ]
    )
  } else { none }, // No footer if no content variables are set

 header: if (header_left != none or title != none or header_right != none)
 
 {
 set align(horizon)
    // This block defines the content and appearance of the header region
    block(
      width: 100%,
      height: 11cm,
      below: 1cm,
      inset: 1cm,
      fill: rgb(header_bg_color), // Background color from YAML
      text(fill: rgb(header_text_color))[ // Text color from YAML

        #grid( // Grid for left/center/right layout
          columns: (1fr, auto, 1fr),
          inset: 1cm,
           if header_left != none { 
          align(left)[#image(header_left, width: 50%, height: 50%)]},     // Left content from YAML
          if title != none {   align(center)[  #text(size: title_text_size)[#title]]},
         if header_right != none {  align(right)[#image(header_right, width: 50%, height: 50%)]},   // Right content from YAML
          
          )
      
      #let count = authors.len()    
      #let ncols = calc.min(count, 3)
    
      #grid(
      columns: (1fr,) * ncols,
      row-gutter: 1em,
      ..authors.map(author =>
          align(center)[
           #text(size: author_text_size)[ #author.name] \
           #text(size: author_text_size)[ #author.affiliation] \
           #text(size: author_text_size)[ #author.email ]
          ]
      )
    )
          
          ]
    )
  } else { none } // No header if no content variables are set
 
 
 
 
  )
  
  
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)



cols = 3

// Add horizontal padding specifically around the main content area
pad(x: 2cm)[

  #if cols == 1 {
    doc
  } else {
    columns(cols, gutter: 1.5cm, doc)
    
    
  }
  
  ]
  
} // end of poster doc

#set table(
  inset: 6pt,
  stroke: none
)
