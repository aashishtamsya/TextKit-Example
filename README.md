# TextKit Example

## Documentation

- The Text Storage class (NSTextStorage)
	-	The NSTextStorage class is in charge for storing all text attribute-related information, such as font or paragraph information. It worths to mention, especially for those developers who have worked with attributed strings, that the NSTextStorage class is a subclass of the NSMutableAttributedString class, and that’s why is responsible for keeping all text attributes. Besides that, its role also lies to making sure that all the edited text attribute data will remain consistent throughout all management and editing operations that may be performed.
	
- The Layout Manager class (NSLayoutManager)
	-	The NSLayoutManager class, as its name implies, manages the way the text data stored to a NSTextStorage object is going to be displayed in a view. Its job is to handle and support any view object that text can be displayed in it, and perform any required conversions of Unicode characters to glyphs in order each character to properly appear on-screen. An object of this class is notified by the NSTextStorage for any modifications been made to text and its attributes, so every change immediately gets reflected in the corresponding view.
	
- The Text Container class (NSTextContainer)
	-	The NSTextContainer class actually specifies the view where the text will appear to and it handles information regarding this view (such as its frame or shape). However, a quite important characteristic of this class is the ability to keep an array of Bezier paths, which define areas that should be excluded from the allowed region where text will appear. This gives Text Kit the unique possibility to let text flow around images or other non-text objects and make developers able to display text in great or demanding manners.
	

Here we will focus in those features that someone may mostly use.

- Dynamic Type and text styles
- Exclusion paths
- Use of Text Storage for managing rich text