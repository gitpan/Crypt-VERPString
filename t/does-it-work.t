use Test::More tests => 4;

use_ok(Crypt::VERPString);

my $cv = Crypt::VERPString->new(key => 'HLAUGAHLGALG');
ok($cv, 'Constructor');

my $foo = 'HURF DUH HLGUAGHLAG';

my $str = $cv->encrypt(31337, $foo);
#print "# $str\n";
ok($str eq '00007a69-RWXNUKP4AFGZAPVCQSON7ZK4R6K7QX6KRYBMABY', 'Encryption');

my $cipher = '00003039-IMVZZX72SSQYYMZ7ZEWXZLNOIAZXD5HYBVCD72A';

my $plain = $cv->decrypt($cipher);
is($plain, $foo, 'Decryption');
