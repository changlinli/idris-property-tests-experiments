
module Main

import Data.Nat
import System.Random

-- A simple generator for natural numbers
generateNat : IO Nat
generateNat = randomRIO (0, 1000) -- generates a random natural number between 0 and 1000

-- A function to run property tests
runTest : (Nat -> Bool) -> IO ()
runTest prop = do
  n <- generateNat
  if prop n then putStrLn "Test passed"
  else putStrLn $ "Test failed for value: " ++ show n

-- A property that states that addition is commutative
commutativityProp : Nat -> Bool
commutativityProp n =
  let m = n + 5 -- we could also use a second generator for this
  in n + m == m + n

main : IO ()
main = do
  putStrLn "Testing commutativity of addition..."
  runTest commutativityProp
