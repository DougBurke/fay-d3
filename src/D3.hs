{-# LANGUAGE EmptyDataDecls    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RebindableSyntax #-}

{-| D3.js bindings for Fay -}
module D3 (
    append,
    attr,
    classed,
    classedWith,
    classedWithIndex,
    d3data,
    enter,
    exit,
    filter,
    filterWith,
    filterWithIndex,
    html,
    htmlWith,
    htmlWithIndex,
    property,
    propertyWith,
    propertyWithIndex,
    remove,
    remove',
    select,
    selectAll,
    style,
    styleWith,  
    styleWithIndex,
    text,
    textWith,
    textWithIndex,
    D3
    ) where

import           Fay.Text hiding (append)
import           FFI
import           Prelude

data D3

-- | Work with data (d3.select().data([]))
data D3D a

----
---- Select
----

d3filter :: Text -> D3 -> Fay D3
d3filter = ffi "%2['filter'](%1)"

filterWith :: (a -> Bool) -> D3D a -> Fay (D3D a)
filterWith = ffi "%2['filter'](%1)"

filterWithIndex :: (a -> Int -> Bool) -> D3D a -> Fay (D3D a)
filterWithIndex = ffi "%2['filter'](%1)"

select :: Text -> Fay D3
select = ffi "d3['select'](%1)"

selectAll :: Text -> D3 -> Fay D3
selectAll = ffi "%2['selectAll'](%1)"

----
---- Manipulation API
----

append :: Text -> D3D a -> Fay (D3D a)
append = ffi "%2['append'](%1)"

attr :: Text -> a -> D3 -> Fay D3
attr = ffi "%3['attr'](%1,%2)"

attrWith :: Text -> (d -> Text) -> D3D a -> Fay (D3D a)
attrWith = ffi "%3['attr'](%1,%2)"

attrWithIndex :: Text -> (d -> Int -> Text) -> D3D a -> Fay (D3D a)
attrWithIndex = ffi "%3['attr'](%1,%2)"

classed :: Text -> Bool -> D3 -> Fay D3
classed = ffi "%3['classed'](%1,%2)"

classedWith :: Text -> (a -> Bool) -> D3D a -> Fay (D3D a)
classedWith = ffi "%3['classed'](%1,%2)"

classedWithIndex :: Text -> (a -> Int -> Bool) -> D3D a -> Fay (D3D a)
classedWithIndex = ffi "%3['classed'](%1,%2)"

html :: Text -> D3 -> Fay D3
html = ffi "%2['html'](%1)"

htmlWith :: (a -> Text) -> D3D a -> Fay (D3D a)
htmlWith = ffi "%2['html'](%1)"

htmlWithIndex :: (a -> Int -> Text) -> D3D a -> Fay (D3D a)
htmlWithIndex = ffi "%2['html'](%1)"

----
---- TODO: Insert
----

property :: Text -> Text -> D3 -> Fay D3
property = ffi "%3['property'](%1,%2)"

propertyWith :: Text -> (a -> Text) -> D3D a -> Fay (D3D a)
propertyWith = ffi "%3['property'](%1,%2)"

propertyWithIndex :: Text -> (a -> Int -> Text) -> D3D a -> Fay (D3D a)
propertyWithIndex = ffi "%3['property'](%1,%2)"

remove :: D3 -> Fay D3
remove = ffi "%1['remove']()"

remove' :: D3D a -> Fay (D3D a)
remove' = ffi "%1['remove']()"

----
---- TODO: Sort
---- 

style :: Text -> Text -> D3 -> Fay D3
style = ffi "%3['style'](%1,%2)"

styleWith :: Text -> (a -> Text) -> D3D a -> Fay (D3D a)
styleWith = ffi "%3['style'](%1,%2)"

styleWithIndex :: Text -> (a -> Int -> Text) -> D3D a -> Fay (D3D a)
styleWithIndex = ffi "%3['style'](%1,%2)"

text :: Text -> D3 -> Fay D3
text = ffi "%2['text'](%1)"

textWith :: (a -> Text) -> D3D a -> Fay (D3D a)
textWith = ffi "%2['text'](%1)"

textWithIndex :: (a -> Int -> Text) -> D3D a -> Fay (D3D a)
textWithIndex = ffi "%2['text'](%1)"

----
---- Data
----
d3data :: [a] -> D3 -> Fay (D3D a)
d3data = ffi "%2['data'](%1)"

enter :: D3D a -> Fay (D3D a)
enter = ffi "%1['enter']()"

exit :: D3D a -> Fay (D3D a)
exit = ffi "%1['exit']()"

