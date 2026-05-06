---
name: spark-file-upload-dropzone
description: Create the dropzone for the FileUpload component
---

# Add Repository Skill

## Overview & Prerequisites

This skill guides you to implement the subcomponent called *Dropzone* in the SparkComponentFileUpload.

Use the figma screenshots in the **template** to check the design of the documentation.

The name of the component must be :
 - swiftUI : *SparkFileUploadDropzone*

The *code* is located in *Sources/Core/Components/Dropzone* folder. The unit tests in "Tests/UnitTests/Components/Dropzone" folder.

Use the parent Claude.md to check how a component must be implemented and tested.

About the subviews : All are optional (icon, text, button and footer)

## Implementation

----------------------------------------------
----------------------------------------------
----------------------------------------------

### AccessibilityIdentifier 

Use the */spark-component-accessibility-identifier* skills to implements enums !

#### Description

- name = FileUploadDropzoneAccessibilityIdentifier
- Contains :
  - view

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Constants 

Use the */spark-component-constants* skills to implements enums !

#### Description

- name = FileUploadDropzoneConstants
- type : enum
- Contains some *static let* properties : 
  - imageSize: 24px, CGFloat

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Model 

Use the */spark-component-model* skills to implements model !

#### Border

##### Description

- name = FileUploadDropzoneBorder
- Contains some variable : 
  - width: CGFloat
  - radius: CGFloat

#### Colors

##### Description

- name = FileUploadDropzoneColors
- Contains some variable : 
  - backgroundColorToken: any ColorToken
  - borderColorToken: any ColorToken
  - imageTintColorToken: any ColorToken
  - descriptionTextColorToken: any ColorToken
  - additionalTextColorToken: any ColorToken

#### Fonts

##### Description

- name = FileUploadDropzoneFonts
- Contains some variable : 
  - descriptionFontToken: any TypographyFontToken
  - additionalTextFontToken: any TypographyFontToken

#### Layout

##### Description

- name = FileUploadDropzoneLayout
- Contains some variable : 
  - verticalSpacing: CGFloat
  - subVerticalSpacing: CGFloat
  - padding: CGFloat

----------------------------------------------
----------------------------------------------
----------------------------------------------

### UseCase 

Use the */spark-component-use-case* skills to implements use cases !

#### GetBorder

##### Description

- name = FileUploadDropzoneGetBorderUseCase
- Parameters : 
  - theme: any Theme
- Return a FileUploadDropzoneBorder: 
  !*Get border from theme*!
  - radius : always equals to *radius/large*
  - width : always equals to *width/small*

#### GetColors

##### Description

- name = FileUploadDropzoneGetColorsUseCase
- Parameters : 
  - theme: any Theme
  - type: SparkFileUploadDropzoneType
  - status: SparkFileUploadDropzoneStatus
- Return a FileUploadDropzoneColors: 
  !*Get colors from theme*!
  - backgroundColorToken: always equals to *Base/Surface*
  - borderColorToken: always equals to *Base/Outline*
  - imageTintColorToken: always equals to *Base/OnSurface*
  - descriptionTextColorToken: always equals to *Base/OnSurface*
  - additionalTextColorToken: always equals to *Base/OnSurface* with Dim1 (*Get dims from theme*)

#### GetFonts

##### Description

- name = FileUploadDropzoneGetFontsUseCase
- Parameters : 
  - theme: any Theme
- Return a FileUploadDropzoneColors: 
  !*Get typography from theme*!

  - descriptionFontToken: always equals to *Body1*
  - additionalTextFontToken: always equals to *Caption*

#### GetLayout

##### Description

- name = FileUploadDropzoneGetLayoutUseCase
- Parameters : 
  - theme: any Theme
- Return a FileUploadDropzoneLayout: 
  !*Get layout spacing from theme*!
  - verticalSpacing: equals to *large*
  - subVerticalSpacing: equals to *medium*
  - padding: equals to *large*

----------------------------------------------
----------------------------------------------
----------------------------------------------

### ViewModel 

Use the */spark-component-view-model* skills to implements ViewModel !

##### Description

- name = FileUploadDropzoneViewModel
- contains all use case created before
- for each results (model or variable) of use case, create the *@Published var*. 
- contains optional properties : 
  - theme: *any theme*
- setup contains the the theme property created before

----------------------------------------------
----------------------------------------------
----------------------------------------------

### View 

Use the */spark-component-view* skills to implements ViewModel !

##### Description

- Use the template **figma.png** and *figma-with-progress.png* to get the UI of the component
- Create the SwiftUI components called SparkFileUploadDropzoneView
- Must contains a padding from the *viewModel.layout.padding*
- Must contains a vertical contentStack between the image and the rest of the subviews (description, button, additionalText) from *viewModel.layout.verticalSpacing*.
- Must contains a vertical contentStack to manage the description, button, additionalText from *viewModel.layout.subVerticalSpacing*.
- Use the SparkButton and SparkUIButton to create the cross button. Use the Constants file to configure the button.
- The view must accept the drag and drop files from fileTypes (array of UTType)
