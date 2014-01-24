{-# LANGUAGE OverloadedStrings #-}

{- Some visualisations with D3.js-}

module Test (main) where

import D3
import JQuery (ready)
import Fay.Text hiding (append)
import FFI
import Prelude

data MyData = Number Int | Label Text

numbers :: [MyData]
numbers = [Number 5, Number 10, Label "L1"]

-- This fails with the following error in Firefox's console:
--    TypeError: Fay$$fayToJs(...).selectAll is not a function
--
main :: Fay ()
main = ready $ do
    select "body" >>= 
        selectAll "p" >>= 
            d3data numbers >>= 
                enter >>= 
                    append "p" >>= 
                    	filterWithIndex (\_ y -> odd y) >>=
                        	htmlWith (\_ -> "<div>An odd div</div>")
    return ()
