Yacc Dosyası için:
	İlk kısım standart headers ve function declarations içeren bir C kod parçası.
	Daha sonra token'larımı declare ediyorum. 
	Tokenların bir ineteger değeri olabileceğinden bunu da belirtiyorum (union ile).
	%left tüm operatörlerin left associative olduğunu ve öncelik sırasını belirlemek için.
	daha sonrasında verilem grammar'a göre actionları belirledim.
	Hata verirse flush yapıyorum ki sonra inputu alabilsin yoksa sıkıntı çıkarıyor.

Lex Dosyası için: 
	ilk kısmı yine header ve function declaration içeren bir c kod parçası.
	sonraki partta gelen lexem'lere göre hangi token'ı dönmesi gerekiyor onu ayarlıyorum. Windows kullandığım için kullandığım text dosyası newline'da \r\n koyuyor bu da dosyadan input alırken hata verdiriyor. Bu yğzden bunu da burada handle'lıyorum.


Test Case'i tam olarak yazamadım çünkü program inputu terminalde manuel olarak user'dan alıyor. Ben de text dosyası oluşturup dosyayı çalıştırırken pipe'layarak test case'lerimi çalıştırıyorum. (./calculator < test.txt)