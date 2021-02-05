import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import Button from '@material-ui/core/Button';
import CameraIcon from '@material-ui/icons/PhotoCamera';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import CssBaseline from '@material-ui/core/CssBaseline';
import Grid from '@material-ui/core/Grid';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import Link from '@material-ui/core/Link';
import ChangeHistoryIcon from '@material-ui/icons/ChangeHistory';

function Copyright() {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {'Copyright © '}
      <Link color="inherit" href="https://github.com/kijimaD/novelify">
        Novelify
      </Link>{' '}
      {new Date().getFullYear()}
      {'.'}
    </Typography>
  );
}

function RankingCard() {
  const useStyles = makeStyles((theme) => ({
    ranking: {
      marginBottom: theme.spacing(2),
      padding: theme.spacing(1),
    },
  }));
  const classes = useStyles();

  return (
    <Card position="relative" className={classes.ranking}>
      <Grid justify="space-between" container>
        <Grid>
          <Typography paragraph>
            これはstoryのタイトルです。
          </Typography>
        </Grid>
        <Grid>
          <Button><ChangeHistoryIcon/></Button>
        </Grid>
      </Grid>
    </Card>
  );
}

const useStyles = makeStyles((theme) => ({
  icon: {
    marginRight: theme.spacing(2),
  },
  appBar: {
    backgroundColor: theme.palette.warning.dark,
  },
  loginButton: {
    marginLeft: 'auto',
  },
  topContent: {
    backgroundColor: theme.palette.warning.light,
    padding: theme.spacing(8, 0, 6),
  },
  content: {
    backgroundColor: theme.palette.background.paper,
    padding: theme.spacing(8, 0, 6),
  },
  footer: {
    backgroundColor: theme.palette.warning.dark,
    padding: theme.spacing(6),
  },
}));

export default function Album() {
  const classes = useStyles();

  return (
    <React.Fragment>
      <CssBaseline />
      <AppBar position="relative" className={classes.appBar}>
        <Toolbar>
          <Typography variant="h6" color="inherit" noWrap>
            Novelify
          </Typography>
          <Button color="inherit" className={classes.loginButton}>
            ログイン
          </Button>
        </Toolbar>
      </AppBar>
      <main>
        {/* unit */}
        <div className={classes.topContent} align="left">
          <Container maxWidth="md">
            <Typography color="textPrimary" component="h1" variant="h2">
              Novelify
            </Typography>
            <Typography color="textSecondary" paragraph>
              分岐で遊ぶアプリ
            </Typography>
            <div>
              <Grid container spacing={2}>
                <Grid item>
                  <Button variant="contained" color="primary">
                    会員登録
                  </Button>
                </Grid>
              </Grid>
            </div>
          </Container>
        </div>
        <div className={classes.content} align="left">
          <Container maxWidth="md">
            <RankingCard />
            <RankingCard />
            <RankingCard />
            <RankingCard />
            <RankingCard />
            <RankingCard />
          </Container>
        </div>
        <div className={classes.content} align="left">
          <Container maxWidth="md">
            <b>ここに売り文句的なものが入る</b>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認する
          </Container>
        </div>
      </main>
      {/* Footer */}
      <footer className={classes.footer}>
        <Typography variant="subtitle1" align="center" color="textSecondary" component="p">
        </Typography>
        <Copyright />
      </footer>
      {/* End footer */}
    </React.Fragment>
  );
}
