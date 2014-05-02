{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad
import           Hakyll

main :: IO ()
main = hakyll $ do
  forM_ ["favicon.ico", "CNAME"] $ \f -> match f $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "index.html" $ do
    route idRoute
    compile $ getResourceBody
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  match "templates/*" $ compile templateCompiler
