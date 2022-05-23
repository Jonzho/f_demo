import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class Step1Controller extends GetxController {
  final player = AudioPlayer();

  @override
  void onInit() {
    _init();
  }

  Future<void> _init() async {
    try {
      await player.setAudioSource(AudioSource.uri(Uri.parse(
          "http://music.163.com/song/media/outer/url?id=4078631.mp3")));
      // await player.setAsset('music/bgm.mp3');
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  int state = 1;
  int bState = 0;
  String context = "点击开始（背景音乐要适当调节音量喔）";
  int who = 0;
  int progess = 0;

  void changeState({int? state, int? bState, int? who}) {
    this.state = state ?? this.state;
    this.bState = bState ?? this.bState;
    this.who = who ?? this.who;
    update(['body', 'talk', 'btn']);
  }

  void talk({bool chance = true}) {
    switch (progess) {
      case 0:
        player.play();
        context = "hi，wingwing，好久不见";
        progess++;
        changeState(who: 1);
        break;
      case 1:
        context = "...";
        progess++;
        changeState(who: 2);
        break;
      case 2:
        context = "没想到能用这种方式见到你";
        progess++;
        changeState(who: 1);
        break;
      case 3:
        context = "我花了点时间创造了这个空间，在这个世界我们是第一次相见吧嘻嘻 ^_^";
        progess++;
        changeState();
        break;
      case 4:
        context = "很开心能再见到你!";
        progess++;
        changeState(bState: 1);
        break;
      case 5:
        context = chance ? "嗯嗯": "...";
        progess++;
        changeState(bState: 0, who: 2);
        break;
      case 6:
        context = "这一次其实是我的一个突发奇想，我想通过这个方式让你了解我";
        progess++;
        changeState(who: 1);
        break;
      case 7:
        context = "你是否能给我一首歌的时间呢";
        progess++;
        changeState(bState: 1);
        break;
      case 8:
        if (chance) {
          context = "好担心你没选是哈哈哈，不然就要提前over了";
          progess++;
          changeState(state: 0,bState: 0);
        } else {
          context = "不听不听，王八念经";
          progess = 999;
          changeState(state: 2,bState: 0, who: 2);
        }
        break;
      case 9:
        context = "我是一个普通的程序员，如你所见，创造这个空间就是我的技能之一嘻嘻";
        progess++;
        changeState(state: 1);
        break;
      case 10:
        context = "从第一次见面到现在，不知不觉都快半年了呢";
        progess++;
        changeState();
        break;
      case 11:
        context = "在我眼里，你是个有趣又帅气的女生，会关心周围人的感受，和你的聊天是很愉快的！";
        progess++;
        changeState();
        break;
      case 12:
        context = "我也开始迷上了和你聊天分享日常";
        progess++;
        changeState();
        break;
      case 13:
        context = "对你的了解越多，我会越想倾听更多关于你的事情";
        progess++;
        changeState();
        break;
      case 14:
        context = "但是以往的经历告诉我，这样是不行的 >_<";
        progess++;
        changeState();
        break;
      case 15:
        context = "我开始尝试着丰富自己的阅历，独自负责项目，又外包工作";
        progess++;
        changeState();
        break;
      case 16:
        context = "但今年好像遇到了我的人生低谷 T_T";
        progess++;
        changeState();
        break;
      case 17:
        context = "遭受了社会的毒打，灰溜溜的回来上班，结果公司还是不景气 〒▽〒";
        progess++;
        changeState();
        break;
      case 18:
        context = "不过我觉得只要不是失去了目标，就不怕被生活打败吧";
        progess++;
        changeState();
        break;
      case 19:
        context = "就如刚认识你的时候，你说过的今年要有好心态";
        progess++;
        changeState();
        break;
      case 20:
        context = "哈哈哈哈哈";
        progess++;
        changeState();
        break;
      case 21:
        context = "我有个最大的缺点，就是固执 ￣へ￣";
        progess++;
        changeState();
        break;
      case 22:
        context = "就像当时想到的这个idea，就立马埋头开始做了，直到你收到的那一刻我才能放下心去想别的事情";
        progess++;
        changeState();
        break;
      case 23:
        context = "这也往往容易忽略周围的人";
        progess++;
        changeState();
        break;
      case 24:
        context = "可能这就是我经常做不好事情的原因吧";
        progess++;
        changeState();
        break;
      case 25:
        context = "不过最后只要能完成，我很容易就能满足了嘻嘻";
        progess++;
        changeState();
        break;
      case 26:
        context = "第一次写剧本，初次尝试很多想法还没能实现";
        progess++;
        changeState();
        break;
      case 27:
        context = "以后也许会再更新吧，也许。。。";
        progess++;
        changeState();
        break;
      case 28:
        context = "你想看的话哈哈哈哈";
        progess++;
        changeState(bState: 1);
        break;
      case 29:
        context = chance?"真的咩？！好的哈哈哈":"嗯嗯";
        progess++;
        changeState(bState: 0);
        break;
      case 30:
        context = "那我的废话就要结束了，最后";
        progess++;
        changeState();
        break;
      case 31:
        context = "还有一件事想问你。。。";
        progess++;
        changeState();
        break;
      case 32:
        context = "今晚可以约你吃饭吗嘻嘻";
        progess++;
        changeState();
        break;
      case 33:
        context = "这里是秘密空间，希望能vx告诉我哈哈哈";
        progess = 999;
        changeState();
        break;

      case 999:
        context = "Anyway，Thank you for watch ^_^";
        changeState(state: 1, bState: 0, who: 0);
        break;
    }
  }
}
