# My Note

## Generate `8cc.hs` and `elc.hs`

```bash
git clone git@github.com:nwtgck/elvm.git
cd elvm/
git checkout cdb029aa2f882613cd9c378a4389bffa0c171350
make
./out/8cc -S -I. -Ilibc -I8cc/include -o 8cc.eir out/8cc.c
./out/8cc -S -I. -Ilibc -I8cc/include -o elc.eir out/elc.c
./out/elc -general_hs 8cc.eir > 8cc.hs
./out/elc -general_hs elc.eir > elc.hs
```
<https://rhysd.hatenablog.com/entry/2016/12/02/030511>
