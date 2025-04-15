
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
  title: none,
  header_left: "images/mindlab.png",
  header_right: "images/tu.png",
  header_bg_color: blue,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  footer_left: "www.themindlab.uk",
  footer_right: none,
  footer_center: none,
  footer_bg_color: red,
  footer_text_color: black,
  cols: 3,
  width: 841mm,
  height:594mm,
  lang: "en",
  region: "UK",
  font: "Lexica Ultralegible",
  fontsize: 28pt,
  title-size: 80pt,
  author-size: 10pt,
  subtitle-size: 38pt,
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
    margin:  (x: 0cm, y: 10cm),
    footer: if (footer_left != none or footer_center != none or footer_right != none) {
    // This block defines the content and appearance of the footer region
    block(
      width: 100%,
      height: 3cm,
      below: 1cm,
      inset: 1cm,
      fill: footer_bg_color, // Background color from YAML
      text(fill: footer_text_color)[ // Text color from YAML
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
      height: 10cm,
      below: 1cm,
      inset: 1cm,
      fill: header_bg_color, // Background color from YAML
      text(fill: footer_text_color)[ // Text color from YAML
        #grid( // Grid for left/center/right layout
          columns: (1fr, auto, 1fr),
          inset: 1cm,
           if header_left != none { 
          align(left)[#image(header_left, width: 50%, height: 50%)]},     // Left content from YAML
          if title != none {   align(center)[  #text(size: title-size)[#title]]},
         if header_right != none {  align(right)[#image(header_right, width: 50%, height: 50%)]},   // Right content from YAML
          
          )
      
      #let count = authors.len()    
      #let ncols = calc.min(count, 3)
    
      #grid(
      columns: (1fr,) * ncols,
      row-gutter: 1em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
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


  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
    
    
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
