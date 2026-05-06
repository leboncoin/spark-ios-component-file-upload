---
name: spark-file-upload-preview
description: Create the file preview for the FileUpload component
---

# Add Repository Skill

## Overview & Prerequisites

This skill guides you to implement the subcomponent called *Preview* in the SparkComponentFileUpload.

Use the figma screenshots in the **template** to check the design of the documentation. (The screenshots contains five *Preview*)

The name of the component must be :
 - swiftUI : *SparkFileUploadPreview*
 - UIKit : *SparkUIFileUploadPreview*

The *code* is located in *Sources/Core/Preview* folder. The unit tests in "Tests/UnitTests/Preview" folder.

Use the parent Claude.md to check how a component must be implemented and tested.

## Implementation

----------------------------------------------
----------------------------------------------
----------------------------------------------

### AccessibilityIdentifier 

Use the */spark-component-accessibility-identifier* skills to implements enums !

#### Description

- name = FileUploadPreviewAccessibilityIdentifier
- Contains :
  - view

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Constants 

Use the */spark-component-constants* skills to implements enums !

#### Description

- name = FileUploadPreviewConstants
- import SparkComponentButton
- type : enum
- Contains sub enum called Button
  - Contains some *static let* properties : 
    - intent: .surface
    - variant: .contrast
    - size: .small

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Enum 

Use the */spark-component-enum* skills to implements enums !

#### FileType

##### Description

- name = FileUploadPreviewType
- the enum is *public* (Put in Public folder)
- Contains 4 cases : 
  - file (default value)
  - image
  - pdf
  - video

#### Status

##### Description

- name = FileUploadPreviewStatus
- the enum is *public* (Put in Public folder)
- Contains 2 cases : 
  - succeed
  - failed

#### Images

##### Description

- name = FileUploadPreviewImage
- the enum is *internal* (Put in Internal folder)
- there is no default value.
- Contains 4 cases : 
  - file
  - image
  - pdf
  - video
  - error
- Contains two internal properties : 
  1. **internal var swiftUIImage** to get the swiftUI Image
  2. **internal var uiKitImage**  to get uiKit UIImage :

  The image is available on SparkCommon (via @_spi(SI_SPI)) : 
  - file : .sparkFileOutline
  - image : .sparkImageOutline
  - pdf : .sparkPdfOutline
  - video : .sparkPlayOutline
  - error : .sparkWarningOutline

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Environment 

Use the */spark-component-environment* skills to implements environments !

For each enums created before, create an *environment*.

----------------------------------------------
----------------------------------------------
----------------------------------------------

### Model 

Use the */spark-component-model* skills to implements model !

#### Border

##### Description

- name = FileUploadPreviewBorder
- Contains some variable : 
  - width: CGFloat
  - radius: CGFloat

#### Colors

##### Description

- name = FileUploadPreviewColors
- Contains some variable : 
  - backgroundColorToken: any ColorToken
  - borderColorToken: any ColorToken
  - imageTintColorToken: any ColorToken
  - filenameTextColorToken: any ColorToken
  - filesizeTextColorToken: any ColorToken
  - errorTextColorToken: any ColorToken

#### Fonts

##### Description

- name = FileUploadPreviewFonts
- Contains some variable : 
  - filenameFontToken: any TypographyFontToken
  - filesizeFontToken: any TypographyFontToken
  - errorFontToken: any TypographyFontToken

#### Layout

##### Description

- name = FileUploadPreviewLayout
- Contains some variable : 
  - horizontalSpacing: CGFloat
  - horizontalPadding: CGFloat
  - verticalPadding: CGFloat

----------------------------------------------
----------------------------------------------
----------------------------------------------

### UseCase 

Use the */spark-component-use-case* skills to implements use cases !

#### GetBorder

##### Description

- name = FileUploadPreviewGetBorderUseCase
- Parameters : 
  - theme: any Theme
  - status: SparkFileUploadPreviewStatus
- Return a FileUploadPreviewBorder: 
  !*Get border from theme*!

  - radius : always equals to *radius/medium*

  And
  - if the *status* is *.succeed* : 
    - width : *width/small*

  - if the *status* is *.failed* : 
    - width : *width/medium*

#### GetColors

##### Description

- name = FileUploadPreviewGetColorsUseCase
- Parameters : 
  - theme: any Theme
  - type: SparkFileUploadPreviewType
  - status: SparkFileUploadPreviewStatus
- Return a FileUploadPreviewColors: 
  !*Get colors from theme*!

  - backgroundColorToken : always equals to *Base/Surface*
  - filenameTextColorToken: always equals to *Base/OnSurface*
  - filesizeTextColorToken: always equals to *Base/OnSurface* with Dim1 (*Get dims from theme*)
  - errorTextColorToken: always equals to *Feedback/Error*

  And
  - if the *status* is *.succeed* : 
    - borderColorToken : *Base/Outline*
    - imageTintColorToken : *Feedback/On Neutral Container*
    - imageBackgroundColorToken : *Feedback/Neutral Container*

  - if the *status* is *.failed* : 
    - borderColorToken : *Feedback/Error*
    - imageTintColorToken : *Feedback/On Error Container*
    - imageBackgroundColorToken : *Feedback/Error Container*

#### GetFonts

##### Description

- name = FileUploadPreviewGetFontsUseCase
- Parameters : 
  - theme: any Theme
- Return a FileUploadPreviewColors: 
  !*Get typography from theme*!

  - filenameFontToken: always equals to *Caption*
  - filesizeFontToken: always equals to *Caption*
  - errorFontToken: always equals to *Caption*

#### GetImage

##### Description

- name = FileUploadPreviewGetImageUseCase
- Parameters : 
  - type: SparkFileUploadPreviewType
  - status: SparkFileUploadPreviewStatus
- Return a SparkFileUploadPreviewImage: 
  If the *status* is *.failed* : return *.error*
  Else return the value with the *same name* as the *type*.

#### GetLayout

##### Description

- name = FileUploadPreviewGetLayoutUseCase
- Parameters : 
  - theme: any Theme
- Return a FileUploadPreviewLayout: 
  !*Get layout spacing from theme*!
  - horizontalSpacing: equals to *medium*
  - horizontalPadding: equals to *medium*
  - verticalPadding: equals to *medium*

----------------------------------------------
----------------------------------------------
----------------------------------------------

### ViewModel 

Use the */spark-component-view-model* skills to implements ViewModel !

##### Description

- name = FileUploadPreviewViewModel
- contains all use case created before
- for each results (model or variable) of use case, create the *@Published var*
- contains optional properties : 
  - theme: *any theme*
  - type: *SparkFileUploadPreviewType*
  - status: *SparkFileUploadPreviewStatus*
- setup contains the 3 properties created before

----------------------------------------------
----------------------------------------------
----------------------------------------------

### View 

Use the */spark-component-view* skills to implements ViewModel !

##### Description

- Use the template **figma.png** and *figma-with-progress.png* to get the UI of the component
- Create two components : 
  - SwiftUI : SparkFileUploadPreviewView
  - UIKit : SparkUIFileUploadPreviewView
- Must contains a horizontal contentStack
- Must contains a vertical contentStack to manage the two labels (filename and error).
- Must contains a horizontal contentStack to manage the two labels (from previous StackView) and the filesize label.
- Must contains a vertical contentStack to manage the preview stackview and an optional dynamic View.
- Hide the error message is the status is .succeed
- Use the SparkButton and SparkUIButton to create the cross button. Use the Constants file to configure the button.
- Use sparkCross image from SparkCommon for the button (via @_spi(SI_SPI))
