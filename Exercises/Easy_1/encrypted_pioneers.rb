=begin

Input: string of letters (names) with spaces and hyphens
spaces separate first / middle / last names
some names have hyphens

names are encrypted using ROT-13
each letter is 13 places ahead in the alphabet.
alphabet wraps around.

make 2 arrays, one for each block of letters
abcdefghijklm
nopqrstuvwxyz

get the index of the letter and use that to 
  return the letter at index in other array.


iterate through the string
map? 
if character is not a space of hyphen
  array2[array1(letter)
else
  character

Outputs: each names deciphered and theh printed. 



=end
ALPHA_A = [*'a'..'m'] + [*'A'..'M']
ALPHA_B = [*'n'..'z'] + [*'N'..'Z']

def decrypt(input)
  array = input.split('')
  array.map! do |char|
    if ALPHA_A.any?(char)
      ALPHA_B[ALPHA_A.index(char)]
    elsif ALPHA_B.any?(char)
      ALPHA_A[ALPHA_B.index(char)]
    else
      char
    end
  end
  array.join
end

p decrypt("Nqn Ybirynpr")

p decrypt("Tenpr Ubccre")
p decrypt("Nqryr Tbyqfgvar")
p decrypt("Nyna Ghevat")
p decrypt("Puneyrf Onoontr")
p decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decrypt("Wbua Ngnanfbss")
p decrypt("Ybvf Unvog")
p decrypt("Pynhqr Funaaba")
p decrypt("Fgrir Wbof")
p decrypt("Ovyy Tngrf")
p decrypt("Gvz Orearef-Yrr")
p decrypt("Fgrir Jbmavnx")
p decrypt("Xbaenq Mhfr")
p decrypt("Fve Nagbal Ubner")
p decrypt("Zneiva Zvafxl")
p decrypt("Lhxvuveb Zngfhzbgb")
p decrypt("Unllvz Fybavzfxv")
p decrypt("Tregehqr Oynapu")


names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

AZ = [*'a'..'z'] + [*'a'..'z'] + [*'A'..'Z'] + [*'A'..'Z']


names = names.split('').map do |chr|
  if AZ.any?(chr)
    AZ[AZ.index(chr) + 13]
  else
    chr
  end
end

puts names.join