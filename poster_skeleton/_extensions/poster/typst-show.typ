
// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: doc => poster(

$if(header_height)$ header_height: "$header_height$", $endif$
$if(header_text_color)$ header_text_color: "$header_text_color$", $endif$
$if(header_bg_color)$ header_bg_color: "$header_bg_color$", $endif$
$if(header_left)$ header_left: "$header_left$", $endif$
$if(title)$ title: [$title$], $endif$
$if(title_text_size)$ title_text_size: "$title_text_size$", $endif$
$if(subtitle)$ subtitle: [$subtitle$],$endif$
$if(header_right)$ header_right: "$header_right$", $endif$
$if(author_text_size)$ author_text_size: "$author_text_size$", $endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
  abstract-title: "$labels.abstract$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$elseif(brand.typography.base.family)$
  font: ("$brand.typography.base.family$",),
$endif$
$if(body_text_size)$ body_text_size: "$body_text_size$", $endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(footer_bg_color)$ footer_bg_color: "$footer_bg_color$", $endif$
$if(footer_text_color)$ footer_text_color: "$footer_text_color$", $endif$
$if(footer_right)$ footer_right: "$footer_right$", $endif$
$if(footer_left)$ footer_left: "$footer_left$", $endif$
$if(footer_center)$ footer_center: "$footer_center$", $endif$
$if(footer_text_size)$ footer_text_size: "$footer_text_size$", $endif$
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)
