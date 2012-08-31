#------------------------------------------------------------------------------
#    mwForum - Web-based discussion forum
#    Copyright (c) 1999-2007 Markus Wichitill
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#------------------------------------------------------------------------------

package MwfGerman;
use strict;
use warnings;
our ($VERSION, $lng);
$VERSION = "2.12.0";

#------------------------------------------------------------------------------

# Default to English for missing strings
no warnings qw(once);
require Forum::MwfEnglish;
%$lng = %$MwfEnglish::lng;

#------------------------------------------------------------------------------

# Language module meta information
$lng->{charset}      = "iso-8859-1";
$lng->{author}       = "Markus Wichitill";

#------------------------------------------------------------------------------

# Common strings
$lng->{comUp}        = "Hoch";
$lng->{comUpTT}      = "Zu h�herer Ebene gehen";
$lng->{comPgTtl}     = "Seite";
$lng->{comPgPrev}    = "Zur�ck";
$lng->{comPgPrevTT}  = "Zu vorheriger Seite gehen";
$lng->{comPgNext}    = "Vor";
$lng->{comPgNextTT}  = "Zu n�chster Seite gehen";
$lng->{comEnabled}   = "aktiviert";
$lng->{comDisabled}  = "deaktiviert";
$lng->{comHidden}    = "(versteckt)";
$lng->{comBoardList} = "Forum";
$lng->{comBoardGo}   = "OK";
$lng->{comNewUnrd}   = "N/U";
$lng->{comNewUnrdTT} = "Neu/Ungelesen";
$lng->{comNewRead}   = "N/-";
$lng->{comNewReadTT} = "Neu/Gelesen";
$lng->{comOldUnrd}   = "-/U";
$lng->{comOldUnrdTT} = "Alt/Ungelesen";
$lng->{comOldRead}   = "-/-";
$lng->{comOldReadTT} = "Alt/Gelesen";
$lng->{comAnswer}    = "B";
$lng->{comAnswerTT}  = "Beantwortet";
$lng->{comShowNew}   = "Neues";
$lng->{comShowNewTT} = "Neue Nachrichten anzeigen";
$lng->{comShowUnr}   = "Ungelesenes";
$lng->{comShowUnrTT} = "Ungelesene Nachrichten anzeigen";
$lng->{comShowTdo}   = "Merkliste";
$lng->{comShowTdoTT} = "Nachrichten auf Merkliste anzeigen";
$lng->{comFeeds}     = "Feeds";
$lng->{comFeedsTT}   = "Atom/RSS-Feeds anzeigen";
$lng->{comCaptcha}   = "Bitte tippen Sie die sechs Buchstaben vom Anti-Spam-Bild ab";
$lng->{comCptImaBot} = "Ich bin ein Spambot";
$lng->{comCptImaMan} = "Ich bin ein Mensch";

# Header
$lng->{hdrForum}     = "Forum";
$lng->{hdrForumTT}   = "Forums-Startseite";
$lng->{hdrHomeTT}    = "Zum Forum geh�rige Homepage";
$lng->{hdrOptions}   = "Optionen";
$lng->{hdrOptionsTT} = "Profil und Optionen �ndern";
$lng->{hdrHelp}      = "Hilfe";
$lng->{hdrHelpTT}    = "Hilfe und FAQ";
$lng->{hdrSearch}    = "Suche";
$lng->{hdrSearchTT}  = "Nachrichten durchsuchen";
$lng->{hdrChat}      = "Chat";
$lng->{hdrChatTT}    = "Chat-Nachrichten lesen und schreiben";
$lng->{hdrMsgs}      = "Nachrichten";
$lng->{hdrMsgsTT}    = "Private Nachrichten lesen und schreiben";
$lng->{hdrBlog}      = "Blog";
$lng->{hdrBlogTT}    = "Eigene Blog-Themen lesen und schreiben";
$lng->{hdrLogin}     = "Anmelden";
$lng->{hdrLoginTT}   = "Mit Benutzername und Passwort anmelden";
$lng->{hdrLogout}    = "Abmelden";
$lng->{hdrLogoutTT}  = "Abmelden";
$lng->{hdrReg}       = "Registrieren";
$lng->{hdrRegTT}     = "Benutzerkonto registrieren";
$lng->{hdrNoLogin}   = "Nicht angemeldet";
$lng->{hdrWelcome}   = "Willkommen,";

# Forum page
$lng->{frmTitle}     = "Forum";
$lng->{frmMarkOld}   = "Alles alt";
$lng->{frmMarkOldTT} = "Alle Nachrichten als alt markieren";
$lng->{frmMarkRd}    = "Alles gelesen";
$lng->{frmMarkRdTT}  = "Alle Nachrichten als gelesen markieren";
$lng->{frmUsers}     = "Benutzer";
$lng->{frmUsersTT}   = "Benutzerliste anzeigen";
$lng->{frmAttach}    = "Dateien";
$lng->{frmAttachTT}  = "Dateianhangsliste anzeigen";
$lng->{frmInfo}      = "Info";
$lng->{frmInfoTT}    = "Foruminfo anzeigen";
$lng->{frmNotTtl}    = "Benachrichtigungen";
$lng->{frmNotDelB}   = "Benachrichtigungen entfernen";
$lng->{frmCtgCollap} = "Kategorie zusammenklappen";
$lng->{frmCtgExpand} = "Kategorie expandieren";
$lng->{frmPosts}     = "Nachrichten";
$lng->{frmLastPost}  = "Neueste";
$lng->{frmRegOnly}   = "Nur f�r registrierte Benutzer";
$lng->{frmMbrOnly}   = "Nur f�r Brettmitglieder";
$lng->{frmNew}       = "neu";
$lng->{frmNoBoards}  = "Keine sichtbaren Bretter.";
$lng->{frmStats}     = "Statistiken";
$lng->{frmOnlUsr}    = "Online";
$lng->{frmOnlUsrTT}  = "Benutzer online w�hrend der letzten 5 Minuten";
$lng->{frmNewUsr}    = "Neu";
$lng->{frmNewUsrTT}  = "Benutzer registriert w�hrend der letzten 5 Tage";
$lng->{frmBdayUsr}   = "Geburtstag";
$lng->{frmBdayUsrTT} = "Benutzer die heute Geburtstag haben";
$lng->{frmBlgPst}    = "Blogs";
$lng->{frmBlgPstTT}  = "Blogs mit neuen Nachrichten";

# Forum info page
$lng->{fifTitle}     = "Forum";
$lng->{fifGenTtl}    = "Allgemeine Info";
$lng->{fifGenAdmEml} = "Emailadresse";
$lng->{fifGenAdmins} = "Administratoren";
$lng->{fifGenTZone}  = "Zeitzone";
$lng->{fifGenVer}    = "Forumsversion";
$lng->{fifGenLang}   = "Sprachen";
$lng->{fifStsTtl}    = "Statistik";
$lng->{fifStsUsrNum} = "Benutzer";
$lng->{fifStsTpcNum} = "Themen";
$lng->{fifStsPstNum} = "Nachrichten";
$lng->{fifStsHitNum} = "Themenzugriffe";

# New/unread/todo/blog overview page
$lng->{ovwTitleNew}  = "Neue Nachrichten";
$lng->{ovwTitleUnr}  = "Ungelesene Nachrichten";
$lng->{ovwTitleTdo}  = "Merkliste";
$lng->{ovwTitleBlg}  = "Neue Blog-Nachrichten";
$lng->{ovwMarkOld}   = "Alles alt";
$lng->{ovwMarkOldTT} = "Alle Nachrichten als alt markieren";
$lng->{ovwMarkRd}    = "Alles gelesen";
$lng->{ovwMarkRdTT}  = "Alle Nachrichten als gelesen markieren";
$lng->{ovwBlogs}     = "Blogs";
$lng->{ovwBlogsTT}   = "Neue Blog-Nachrichten anzeigen";
$lng->{ovwTdoRemove} = "Entfernen";
$lng->{ovwEmpty}     = "Keine Nachrichten vorhanden.";
$lng->{ovwMaxCutoff} = "Weitere Nachrichten wurden ausgelassen, um die Seitenl�nge zu begrenzen.";

# Board page
$lng->{brdTitle}     = "Brett";
$lng->{brdNewTpc}    = "Thema hinzuf�gen";
$lng->{brdNewTpcTT}  = "Neues Thema hinzuf�gen";
$lng->{brdInfo}      = "Info";
$lng->{brdInfoTT}    = "Brettinfo anzeigen";
$lng->{brdPrev}      = "Zur�ck";
$lng->{brdPrevTT}    = "Zu vorherigem Brett gehen";
$lng->{brdNext}      = "Vor";
$lng->{brdNextTT}    = "Zu n�chstem Brett gehen";
$lng->{brdTopic}     = "Thema";
$lng->{brdPoster}    = "Schreiber";
$lng->{brdPosts}     = "Nachrichten";
$lng->{brdLastPost}  = "Neueste";
$lng->{brdLocked}    = "L";
$lng->{brdLockedTT}  = "Gesperrt";
$lng->{brdInvis}     = "I";
$lng->{brdInvisTT}   = "Unsichtbar";
$lng->{brdPoll}      = "P";
$lng->{brdPollTT}    = "Umfrage";
$lng->{brdNew}       = "neu";
$lng->{brdAdmin}     = "Administration";
$lng->{brdAdmRep}    = "Beschwerden";
$lng->{brdAdmRepTT}  = "Beschwerden �ber Nachrichten anzeigen";
$lng->{brdAdmMbr}    = "Mitglieder";
$lng->{brdAdmMbrTT}  = "Brettmitglieder hinzuf�gen und entfernen";
$lng->{brdAdmGrp}    = "Gruppen";
$lng->{brdAdmGrpTT}  = "Gruppenbefugnisse editieren";
$lng->{brdAdmOpt}    = "Optionen";
$lng->{brdAdmOptTT}  = "Brettoptionen editieren";
$lng->{brdAdmDel}    = "L�schen";
$lng->{brdAdmDelTT}  = "Brett l�schen";
$lng->{brdBoardFeed} = "Brett-Feed";

# Board info page
$lng->{bifTitle}     = "Brett";
$lng->{bifOptTtl}    = "Optionen";
$lng->{bifOptDesc}   = "Beschreibung";
$lng->{bifOptLock}   = "Sperrzeit";
$lng->{bifOptLockT}  = "Tage nach letzter Nachricht werden Themen gesperrt";
$lng->{bifOptExp}    = "Haltezeit";
$lng->{bifOptExpT}   = "Tage nach letzter Nachricht werden Themen gel�scht";
$lng->{bifOptAttc}   = "Anh�nge";
$lng->{bifOptAttcY}  = "Dateianh�nge sind aktiviert";
$lng->{bifOptAttcN}  = "Dateianh�nge sind nicht aktiviert";
$lng->{bifOptAprv}   = "Moderation";
$lng->{bifOptAprvY}  = "Nachrichten m�ssen best�tigt werden, um sichtbar zu sein";
$lng->{bifOptAprvN}  = "Nachrichten m�ssen nicht best�tigt werden, um sichtbar zu sein";
$lng->{bifOptPriv}   = "Lesezugriff";
$lng->{bifOptPriv0}  = "Alle Benutzer k�nnen das Brett sehen";
$lng->{bifOptPriv1}  = "Nur Admins/Moderatoren/Mitglieder k�nnen das Brett sehen";
$lng->{bifOptPriv2}  = "Nur registrierte Benutzer k�nnen das Brett sehen";
$lng->{bifOptAnnc}   = "Schreibzugriff";
$lng->{bifOptAnnc0}  = "Alle Benutzer k�nnen schreiben";
$lng->{bifOptAnnc1}  = "Nur Admins/Moderatoren/Mitglieder k�nnen schreiben";
$lng->{bifOptAnnc2}  = "Admins/Moderatoren/Mitglieder k�nnen neue Themen starten, alle k�nnen antworten";
$lng->{bifOptUnrg}   = "Registrierung";
$lng->{bifOptUnrgY}  = "Schreiben ist auch ohne Registrierung m�glich";
$lng->{bifOptUnrgN}  = "Schreiben ist nur mit Registrierung m�glich";
$lng->{bifOptAnon}   = "Anonym";
$lng->{bifOptAnonY}  = "Nachrichten sind anonym";
$lng->{bifOptAnonN}  = "Nachrichten sind nicht anonym";
$lng->{bifOptFlat}   = "Struktur";
$lng->{bifOptFlatY}  = "Nachrichten werden sequentiell angeordnet";
$lng->{bifOptFlatN}  = "Nachrichten werden in einer Baumstruktur angeordnet";
$lng->{bifAdmsTtl}   = "Moderatoren";
$lng->{bifMbrsTtl}   = "Mitglieder";
$lng->{bifStatTtl}   = "Statistik";
$lng->{bifStatTPst}  = "Anzahl Nachrichten";
$lng->{bifStatLPst}  = "Neueste Nachricht";

# Topic page
$lng->{tpcTitle}     = "Thema";
$lng->{tpcBlgTitle}  = "Blog-Thema";
$lng->{tpcHits}      = "Hits";
$lng->{tpcTag}       = "Taggen";
$lng->{tpcTagTT}     = "Thema-Tag setzen";
$lng->{tpcSubs}      = "Abonnieren";
$lng->{tpcSubsTT}    = "Thema per Email abonnieren";
$lng->{tpcPolAdd}    = "Umfrage hinzuf�gen";
$lng->{tpcPolAddTT}  = "Umfrage hinzuf�gen";
$lng->{tpcPolDel}    = "L�schen";
$lng->{tpcPolDelTT}  = "Umfrage l�schen";
$lng->{tpcPolLock}   = "Beenden";
$lng->{tpcPolLockTT} = "Umfrage beenden (irreversibel)";
$lng->{tpcPolTtl}    = "Umfrage";
$lng->{tpcPolLocked} = "(beendet)";
$lng->{tpcPolVote}   = "Abstimmen";
$lng->{tpcPolShwRes} = "Ergebnis anzeigen";
$lng->{tpcRevealTT}  = "Unsichtbare Nachrichten aufdecken";
$lng->{tpcHidTtl}    = "Unsichtbare Nachricht";
$lng->{tpcHidIgnore} = "(ignoriert) ";
$lng->{tpcHidUnappr} = "(unbest�tigt) ";
$lng->{tpcPrev}      = "Zur�ck";
$lng->{tpcPrevTT}    = "Zu vorherigem Thema gehen";
$lng->{tpcNext}      = "Vor";
$lng->{tpcNextTT}    = "Zu n�chstem Thema gehen";
$lng->{tpcApprv}     = "Best�tigen";
$lng->{tpcApprvTT}   = "Nachricht f�r alle sichtbar machen";
$lng->{tpcReport}    = "Beschweren";
$lng->{tpcReportTT}  = "Nachricht auf Beschwerdeliste setzen";
$lng->{tpcTodo}      = "Merken";
$lng->{tpcTodoTT}    = "Nachricht auf Merkliste setzen";
$lng->{tpcBranch}    = "Zweig";
$lng->{tpcBranchTT}  = "Zweig umwandeln/verschieben/l�schen";
$lng->{tpcEdit}      = "�ndern";
$lng->{tpcEditTT}    = "Nachricht editieren";
$lng->{tpcDelete}    = "L�schen";
$lng->{tpcDeleteTT}  = "Nachricht l�schen";
$lng->{tpcAttach}    = "Anh�ngen";
$lng->{tpcAttachTT}  = "Dateianh�nge hochladen und l�schen";
$lng->{tpcReply}     = "Antworten";
$lng->{tpcReplyTT}   = "Auf Nachricht antworten";
$lng->{tpcQuote}     = "Zitieren";
$lng->{tpcQuoteTT}   = "Auf Nachricht antworten mit Zitat";
$lng->{tpcBrnCollap} = "Zweig zusammenklappen";
$lng->{tpcBrnExpand} = "Zweig expandieren";
$lng->{tpcNxtPst}    = "N�chste";
$lng->{tpcNxtPstTT}  = "Zu n�chster neuer oder ungelesener Nachricht gehen";
$lng->{tpcParent}    = "Basis";
$lng->{tpcParentTT}  = "Zu beantworteter Nachricht gehen";
$lng->{tpcInvis}     = "I";
$lng->{tpcInvisTT}   = "Unsichtbar";
$lng->{tpcBrdAdmTT}  = "Moderator";
$lng->{tpcAttText}   = "Dateianhang:";
$lng->{tpcAdmStik}   = "Fixieren";
$lng->{tpcAdmUnstik} = "Defixieren";
$lng->{tpcAdmLock}   = "Sperren";
$lng->{tpcAdmUnlock} = "Entsperren";
$lng->{tpcAdmMove}   = "Verschieben";
$lng->{tpcAdmMerge}  = "Zusammenlegen";
$lng->{tpcAdmDelete} = "L�schen";
$lng->{tpcBy}        = "Von";
$lng->{tpcOn}        = "Datum";
$lng->{tpcEdited}    = "Editiert";
$lng->{tpcLocked}    = "(gesperrt)";

# Topic subscription page
$lng->{tsbTitle}     = "Thema";
$lng->{tsbSubTtl}    = "Thema abbonieren";
$lng->{tsbSubT}      = "Wenn Sie dieses Thema abonnieren, bekommen Sie neue Nachrichten regelm��ig per Email zugestellt (H�ufigkeit h�ngt von der Forumskonfiguration ab).";
$lng->{tsbSubB}      = "Abonnieren";
$lng->{tsbUnsubTtl}  = "Thema abbestellen";
$lng->{tsbUnsubB}    = "Abbestellen";

# Add poll page
$lng->{aplTitle}     = "Umfrage hinzuf�gen";
$lng->{aplPollTitle} = "Umfragetitel bzw. Frage";
$lng->{aplPollOpts}  = "Optionen";
$lng->{aplPollMulti} = "Mehrfaches Abstimmen f�r verschiedene Optionen zulassen";
$lng->{aplPollNote}  = "Hinweis: man kann Umfragen nicht editieren und man kann sie nicht mehr l�schen, wenn bereits jemand abgestimmt hat. Daher bitte den Titel und die Optionen vor dem Hinzuf�gen gr�ndlich �berpr�fen.";
$lng->{aplPollAddB}  = "Hinzuf�gen";

# Add todo page
$lng->{atdTitle}     = "Nachricht";
$lng->{atdTodoTtl}   = "Nachricht auf Merkliste setzen";
$lng->{atdTodoT}     = "Falls Sie diese Nachricht sp�ter beantworten oder lesen wollen, k�nnen Sie sie auf eine pers�nliche Merkliste setzen, so dass sie nicht in Vergessenheit ger�t.";
$lng->{atdTodoB}     = "Hinzuf�gen";

# Add report page
$lng->{arpTitle}     = "Nachricht";
$lng->{arpRepTtl}    = "Nachricht auf Beschwerdeliste setzen";
$lng->{arpRepT}      = "Falls diese Nachricht einen Inhalt hat, der gegen die Regeln des Forums verst��t, k�nnen Sie sie auf eine Beschwerdeliste setzen, die von den Administratoren und Moderatoren eingesehen werden kann.";
$lng->{arpRepReason} = "Begr�ndung:";
$lng->{arpRepB}      = "Beschweren";

# Report list page
$lng->{repTitle}     = "Beschwerdeliste";
$lng->{repBy}        = "Beschwerde von";
$lng->{repOn}        = "Am";
$lng->{repTopic}     = "Thema";
$lng->{repPoster}    = "Schreiber";
$lng->{repPosted}    = "Datum";
$lng->{repDeleteB}   = "Beschwerde entfernen";
$lng->{repEmpty}     = "Keine Nachrichten auf der Beschwerdeliste.";

# Reply page
$lng->{rplTitle}     = "Thema";
$lng->{rplBlgTitle}  = "Blog-Thema";
$lng->{rplReplyTtl}  = "Antwort schreiben";
$lng->{rplReplyBody} = "Text";
$lng->{rplReplyNtfy} = "Antwortbenachrichtigungen empfangen";
$lng->{rplReplyResp} = "Auf Nachricht von";
$lng->{rplReplyB}    = "Schreiben";
$lng->{rplReplyPrvB} = "Vorschau";
$lng->{rplPrvTtl}    = "Vorschau";
$lng->{rplEmailFrm}  = "Forum: ";
$lng->{rplEmailBrd}  = "Brett: ";
$lng->{rplEmailTpc}  = "Thema: ";
$lng->{rplEmailUsr}  = "Schreiber: ";
$lng->{rplEmailUrl}  = "Link: ";
$lng->{rplEmailSbj}  = "Antwortbenachrichtigung";
$lng->{rplEmailT2}   = "Dies ist eine automatische Benachrichtigung der Forumssoftware.\nBitte antworten Sie nicht auf diese Email, sondern im Forum.";

# New topic page
$lng->{ntpTitle}     = "Brett";
$lng->{ntpBlgTitle}  = "Blog";
$lng->{ntpTpcTtl}    = "Neues Thema schreiben";
$lng->{ntpTpcSbj}    = "Betreff";
$lng->{ntpTpcBody}   = "Text";
$lng->{ntpTpcNtfy}   = "Antwortbenachrichtigungen empfangen";
$lng->{ntpTpcB}      = "Schreiben";
$lng->{ntpTpcPrvB}   = "Vorschau";
$lng->{ntpPrvTtl}    = "Vorschau";

# Post edit page
$lng->{eptTitle}     = "Nachricht";
$lng->{eptEditTtl}   = "Nachricht editieren";
$lng->{eptEditSbj}   = "Betreff";
$lng->{eptEditBody}  = "Text";
$lng->{eptEditB}     = "�ndern";
$lng->{eptDeleted}   = "[gel�scht]";

# Post attachments page
$lng->{attTitle}     = "Dateianh�nge";
$lng->{attUplTtl}    = "Hochladen";
$lng->{attUplFile}   = "Datei (max. Gr��e [[bytes]] Bytes)";
$lng->{attUplEmbed}  = "Einbetten (nur f�r JPG, PNG und GIF-Bilder)";
$lng->{attUplB}      = "Hochladen";
$lng->{attAttTtl}    = "Anhang";
$lng->{attAttDelB}   = "L�schen";
$lng->{attAttTglB}   = "Einbettung umschalten";

# User info page
$lng->{uifTitle}     = "Benutzer";
$lng->{uifListPst}   = "Nachrichten";
$lng->{uifListPstTT} = "�ffentliche Nachrichten dieses Benutzers auflisten";
$lng->{uifBlog}      = "Blog";
$lng->{uifBlogTT}    = "Blog dieses Benutzers anzeigen";
$lng->{uifMessage}   = "Nachricht senden";
$lng->{uifMessageTT} = "Private Nachricht an diesen Benutzer senden";
$lng->{uifIgnore}    = "Ignorieren";
$lng->{uifIgnoreTT}  = "Diesen Benutzer ignorieren";
$lng->{uifProfTtl}   = "Profil";
$lng->{uifProfUName} = "Benutzername";
$lng->{uifProfRName} = "Realname";
$lng->{uifProfBdate} = "Geburtstag";
$lng->{uifProfEml}   = "Emailadresse";
$lng->{uifProfPage}  = "Website";
$lng->{uifProfOccup} = "T�tigkeit";
$lng->{uifProfHobby} = "Hobbies";
$lng->{uifProfLocat} = "Wohnort";
$lng->{uifProfGeoIp} = "IP Land";
$lng->{uifProfIcq}   = "Messenger";
$lng->{uifProfSig}   = "Signatur";
$lng->{uifProfAvat}  = "Avatar";
$lng->{uifGrpMbrTtl} = "Gruppenmitglied";
$lng->{uifBrdAdmTtl} = "Brettmoderator";
$lng->{uifBrdMbrTtl} = "Brettmitglied";
$lng->{uifBrdSubTtl} = "Brettabonnements";
$lng->{uifStatTtl}   = "Statistik";
$lng->{uifStatRank}  = "Rang";
$lng->{uifStatPNum}  = "Nachrichten";
$lng->{uifStatBNum}  = "Blog-Themen";
$lng->{uifStatRegTm} = "Registriert";
$lng->{uifStatLOTm}  = "Zul. anwesend";
$lng->{uifStatLRTm}  = "Zul. gelesen";
$lng->{uifStatLIp}   = "Letzte IP";

# User list page
$lng->{uliTitle}     = "Benutzerliste";
$lng->{uliLfmTtl}    = "Listenformat";
$lng->{uliLfmSearch} = "Suche";
$lng->{uliLfmField}  = "Feld";
$lng->{uliLfmSort}   = "Sort.";
$lng->{uliLfmSrtNam} = "Benutzername";
$lng->{uliLfmSrtUid} = "Benutzer-ID";
$lng->{uliLfmSrtFld} = "Feld";
$lng->{uliLfmOrder}  = "Reihenf.";
$lng->{uliLfmOrdAsc} = "Aufst.";
$lng->{uliLfmOrdDsc} = "Abst.";
$lng->{uliLfmHide}   = "Leere verstecken";
$lng->{uliLfmListB}  = "Auflisten";
$lng->{uliLstName}   = "Benutzername";

# User login page
$lng->{lgiTitle}     = "Benutzer";
$lng->{lgiLoginTtl}  = "Anmelden";
$lng->{lgiLoginT}    = "Bitte geben Sie Benutzernamen und Passwort an. Falls Sie Ihren Benutzernamen vergessen haben, k�nnen Sie stattdessen die Emailadresse des Kontos angegeben. Falls Sie noch kein Benutzerkonto besitzen, k�nnen Sie eines <a href='user_register.pl'>registrieren</a>. Falls Sie gerade ein Konto registriert haben, sollten die Kontoinformationen per Email gekommen sein.";
$lng->{lgiLoginName} = "Benutzername";
$lng->{lgiLoginPwd}  = "Passwort";
$lng->{lgiLoginRmbr} = "Auf diesem Computer merken";
$lng->{lgiLoginB}    = "Anmelden";
$lng->{lgiFpwTtl}    = "Passwort vergessen";
$lng->{lgiFpwT}      = "Falls Sie Ihr Passwort verloren haben, tragen Sie bitte Ihren Benutzernamen ein und klicken Sie auf Zusenden, um eine Email mit einem Anmeldungs-Ticket-Link an Ihre registrierte Emailadresse zugeschickt zu bekommen. Falls Sie den Benutzernamen ebenfalls vergessen haben, k�nnen Sie stattdessen die Emailadresse des Kontos angeben. Bitte benutzen Sie diese Funktion nicht mehrfach hintereinander falls die Email nicht sofort ankommt, da nur der Ticket-Link in der zuletzt verschickten Email g�ltig ist.";
$lng->{lgiFpwB}      = "Zusenden";
$lng->{lgiFpwMlSbj}  = "Passwort vergessen";
$lng->{lgiFpwMlT}    = "Besuchen Sie bitte den folgenden Ticket-Link, um sich ohne Passwort anzumelden. Sie k�nnen dann ein neues Passwort eingeben.\n\nAus Sicherheitsgr�nden ist der Ticket-Link nur einmal und nur f�r eine begrenzte Zeit g�ltig. Au�erdem gilt nur der zuletzt zugesandte Ticket-Link, falls Sie sich mehrere haben zuschicken lassen.";

# User registration page
$lng->{regTitle}     = "Benutzer";
$lng->{regRegTtl}    = "Konto registrieren";
$lng->{regRegT}      = "Bitte geben Sie die folgenden Daten ein, um ein Benutzerkonto zu registrieren. Falls Sie schon ein Konto besitzen, k�nnen Sie sich auf der <a href='user_login.pl'>Anmelden-Seite</a> anmelden oder sich ein verlorenes Passwort noch einmal zuschicken lassen.";
$lng->{regRegName}   = "Benutzername";
$lng->{regRegEmail}  = "Emailadresse (Anmeldungs-Passwort wird an diese Adresse gesendet)";
$lng->{regRegEmailV} = "Emailadresse wiederholen";
$lng->{regRegB}      = "Registrieren";
$lng->{regMailSubj}  = "Registrierung";
$lng->{regMailT}     = "Sie haben ein Forums-Benutzerkonto registriert.";
$lng->{regMailName}  = "Benutzername: ";
$lng->{regMailPwd}   = "Passwort: ";
$lng->{regMailT2}    = "Nachdem Sie sich per Link oder manuell per Benutzername und Passwort im Forum angemeldet haben, �ndern Sie bitte unter \"Optionen\" ihr Passwort und passen Sie Profil und andere Optionen nach Bedarf an.";

# User options page
$lng->{uopTitle}     = "Benutzer";
$lng->{uopPasswd}    = "Passwort";
$lng->{uopPasswdTT}  = "Passwort �ndern";
$lng->{uopEmail}     = "Email";
$lng->{uopEmailTT}   = "Emailadresse �ndern";
$lng->{uopBoards}    = "Bretter";
$lng->{uopBoardsTT}  = "Brettoptionen einstellen";
$lng->{uopTopics}    = "Themen";
$lng->{uopTopicsTT}  = "Themenoptionen einstellen";
$lng->{uopAvatar}    = "Avatar";
$lng->{uopAvatarTT}  = "Avatarbild ausw�hlen";
$lng->{uopIgnore}    = "Ignorieren";
$lng->{uopIgnoreTT}  = "Andere Benutzer ignorieren";
$lng->{uopOpenPgp}   = "OpenPGP";
$lng->{uopOpenPgpTT} = "OpenPGP-Optionen einstellen";
$lng->{uopInfo}      = "Info";
$lng->{uopInfoTT}    = "Benutzerinfo anzeigen";
$lng->{uopProfTtl}   = "Profil";
$lng->{uopProfRName} = "Realname";
$lng->{uopProfBdate} = "Geburtstag (JJJJ-MM-TT oder MM-TT)";
$lng->{uopProfPage}  = "Website";
$lng->{uopProfOccup} = "T�tigkeit";
$lng->{uopProfHobby} = "Hobbies";
$lng->{uopProfLocat} = "Wohnort";
$lng->{uopProfIcq}   = "Instant Messenger IDs";
$lng->{uopProfSig}   = "Signatur";
$lng->{uopProfSigLt} = "(max. 100 Zeichen auf 2 Zeilen)";
$lng->{uopPrefTtl}   = "Allgemeine Optionen";
$lng->{uopPrefHdEml} = "Eigene Emailadresse verstecken";
$lng->{uopPrefPrivc} = "Eigenen Online-Status verstecken";
$lng->{uopPrefSecLg} = "Anmeldung auf SSL-Verbindungen beschr�nken (f�r Experten)";
$lng->{uopPrefMnOld} = "Nachrichten manuell als alt markieren";
$lng->{uopPrefNtMsg} = "Benachrichtigungen �ber Antworten und private Nachrichten auch per Email empfangen";
$lng->{uopPrefNt}    = "Benachrichtigungen �ber Antworten empfangen";
$lng->{uopDispTtl}   = "Anzeigeoptionen";
$lng->{uopDispLang}  = "Sprache";
$lng->{uopDispTimeZ} = "Zeitzone";
$lng->{uopDispStyle} = "Stil";
$lng->{uopDispFFace} = "Schriftart";
$lng->{uopDispFSize} = "Schriftgr��e (in Pixeln, 0 = Standard)";
$lng->{uopDispIndnt} = "Einzug (1-10%, f�r Baumstruktur)";
$lng->{uopDispTpcPP} = "Themen pro Seite (0 = benutze erlaubtes Maximum)";
$lng->{uopDispPstPP} = "Nachrichten pro Seite (0 = benutze erlaubtes Maximum)";
$lng->{uopDispDescs} = "Brettbeschreibungen anzeigen";
$lng->{uopDispDeco}  = "Dekoration wie Benutzertitel, R�nge, Smileys anzeigen";
$lng->{uopDispAvas}  = "Avatare anzeigen";
$lng->{uopDispImgs}  = "Eingebettete Bilder anzeigen";
$lng->{uopDispSigs}  = "Signaturen anzeigen";
$lng->{uopDispColl}  = "Themenzweige ohne neue/ungel. Nachrichten zusammenklappen";
$lng->{uopSubmitTtl} = "Optionen �ndern";
$lng->{uopSubmitB}   = "�ndern";

# User password page
$lng->{pwdTitle}     = "Benutzer";
$lng->{pwdChgTtl}    = "Passwort �ndern";
$lng->{pwdChgT}      = "Benutzen Sie bitte niemals dasselbe Passwort f�r verschiedene Konten.";
$lng->{pwdChgPwd}    = "Passwort";
$lng->{pwdChgPwdV}   = "Passwort wiederholen";
$lng->{pwdChgB}      = "�ndern";

# User email page
$lng->{emlTitle}     = "Benutzer";
$lng->{emlChgTtl}    = "Emailadresse";
$lng->{emlChgT}      = "Eine neue oder ge�nderte Emailadresse wird erst wirksam, wenn Sie auf die an diese Adresse gesendete Best�tigungsemail reagiert haben.";
$lng->{emlChgAddr}   = "Emailadresse";
$lng->{emlChgAddrV}  = "Emailadresse wiederholen";
$lng->{emlChgB}      = "�ndern";
$lng->{emlChgMlSubj} = "Emailadressen-�nderung";
$lng->{emlChgMlT}    = "Sie haben eine �nderung Ihrer Emailadresse beantragt. Um die G�ltigkeit der neuen Adresse zu verifizieren, wird die Adresse erst ge�ndert, wenn Sie den folgenden Ticket-Link besuchen:";

# User board options page
$lng->{ubdTitle}     = "Benutzer";
$lng->{ubdBrdStTtl}  = "Brettoptionen";
$lng->{ubdBrdStSubs} = "Abonnieren";
$lng->{ubdBrdStHide} = "Verstecken";
$lng->{ubdSubmitTtl} = "Brettoptionen �ndern";
$lng->{ubdChgB}      = "�ndern";

# User topic options page
$lng->{utpTitle}     = "Benutzer";
$lng->{utpTpcStTtl}  = "Themenoptionen";
$lng->{utpTpcStSubs} = "Abonnieren";
$lng->{utpEmpty}     = "Keine Themen mit aktivierten Optionen gefunden.";
$lng->{utpSubmitTtl} = "Themenoptionen �ndern";
$lng->{utpChgB}      = "�ndern";

# Avatar page
$lng->{avaTitle}     = "Benutzer";
$lng->{avaUplTtl}    = "Eigener Avatar";
$lng->{avaUplFile}   = "JPG/PNG/GIF-Bild, max. Gr��e [[bytes]] Bytes, genaue Dimensionen [[width]]x[[height]] Pixel, keine Animation.";
$lng->{avaUplResize} = "Nicht konforme Bilder werden automatisch umformatiert, was nicht unbedingt das beste Ergebnis liefert.";
$lng->{avaUplUplB}   = "Hochladen";
$lng->{avaUplDelB}   = "L�schen";
$lng->{avaGalTtl}    = "Avatar-Galerie";
$lng->{avaGalSelB}   = "Ausw�hlen";
$lng->{avaGalDelB}   = "Entfernen";

# User ignore page
$lng->{uigTitle}     = "Benutzer";
$lng->{uigAddT}      = "Wenn Sie einen anderen Benutzer ignorieren, werden dessen private Nachrichten an Sie verworfen, und �ffentliche Nachrichten des Benutzers werden Ihnen nicht angezeigt (k�nnen aber gezielt aufgedeckt werden).";
$lng->{uigAddTtl}    = "Benutzer ignorieren";
$lng->{uigAddUser}   = "Benutzername";
$lng->{uigAddB}      = "Ignorieren";
$lng->{uigRemTtl}    = "Benutzer nicht mehr ignorieren";
$lng->{uigRemUser}   = "Benutzername";
$lng->{uigRemB}      = "Entfernen";

# Group info page
$lng->{griTitle}     = "Gruppe";
$lng->{griMbrTtl}    = "Mitglieder";
$lng->{griBrdAdmTtl} = "Brettmoderator-Befugnisse";
$lng->{griBrdMbrTtl} = "Brettmitglieds-Befugnisse";

# Board membership page
$lng->{mbrTitle}     = "Brett";
$lng->{mbrAddTtl}    = "Mitglied hinzuf�gen";
$lng->{mbrAddUser}   = "Benutzername";
$lng->{mbrAddB}      = "Hinzuf�gen";
$lng->{mbrRemTtl}    = "Mitglied entfernen";
$lng->{mbrRemUser}   = "Benutzername";
$lng->{mbrRemB}      = "Entfernen";

# Board groups page
$lng->{bgrTitle}     = "Brett";
$lng->{bgrPermTtl}   = "Befugnisse";
$lng->{bgrModerator} = "Moderator";
$lng->{bgrMember}    = "Mitglied";
$lng->{bgrChangeTtl} = "Befugnisse �ndern";
$lng->{bgrChangeB}   = "�ndern";

# Topic tag page
$lng->{ttgTitle}     = "Thema";
$lng->{ttgTagTtl}    = "Thema-Tag";
$lng->{ttgTagB}      = "Taggen";

# Topic move page
$lng->{mvtTitle}     = "Thema";
$lng->{mvtMovTtl}    = "Thema verschieben";
$lng->{mvtMovDest}   = "Zielbrett";
$lng->{mvtMovB}      = "Verschieben";

# Topic merge page
$lng->{mgtTitle}     = "Thema";
$lng->{mgtMrgTtl}    = "Themen zusammenlegen";
$lng->{mgtMrgDest}   = "Zielthema";
$lng->{mgtMrgDest2}  = "Alternative manuelle ID-Eingabe (f�r �ltere Themen und Themen in anderen Brettern)";
$lng->{mgtMrgB}      = "Zusammenlegen";

# Branch page
$lng->{brnTitle}     = "Themenzweig";
$lng->{brnPromoTtl}  = "Zu Thema umwandeln";
$lng->{brnPromoSbj}  = "Betreff";
$lng->{brnPromoBrd}  = "Brett";
$lng->{brnPromoLink} = "Querverweis-Nachrichten einf�gen";
$lng->{brnPromoB}    = "Umwandeln";
$lng->{brnProLnkBdy} = "Themenzweig verschoben";
$lng->{brnMoveTtl}   = "Verschieben";
$lng->{brnMovePrnt}  = "ID der �bergeordneten Nachricht (kann in anderem Thema sein, 0 = mache zu erster Nachricht)";
$lng->{brnMoveB}     = "Verschieben";
$lng->{brnDeleteTtl} = "L�schen";
$lng->{brnDeleteB}   = "L�schen";

# Search page
$lng->{seaTitle}     = "Suche";
$lng->{seaTtl}       = "Kriterien";
$lng->{seaAdvOpt}    = "Mehr";
$lng->{seaBoard}     = "Brett";
$lng->{seaBoardAll}  = "Alle Bretter";
$lng->{seaWords}     = "W�rter";
$lng->{seaWordsChng} = "Einige W�rter und/oder Zeichen wurden ge�ndert oder entfernt, da der aus Geschwindigkeitsgr�nden benutzte Volltextindex die Suche nach genau dem eingetippten Ausdruck nicht unterst�tzt. Dies betrifft W�rter mit weniger als drei Buchstaben, h�ufig vorkommende W�rter sowie Sonderzeichen au�erhalb von Anf�hrungszeichen.";
$lng->{seaUser}      = "Schreiber";
$lng->{seaMinAge}    = "Min. Alter";
$lng->{seaMaxAge}    = "Max. Alter";
$lng->{seaField}     = "Feld";
$lng->{seaFieldBody} = "Text";
$lng->{seaFieldSubj} = "Betreff";
$lng->{seaSort}      = "Sort.";
$lng->{seaSortTime}  = "Datum";
$lng->{seaSortUser}  = "Schreiber";
$lng->{seaSortRelev} = "Relevanz";
$lng->{seaOrder}     = "Reihenf.";
$lng->{seaOrderAsc}  = "Aufst.";
$lng->{seaOrderDesc} = "Abst.";
$lng->{seaShowBody}  = "Text anzeigen";
$lng->{seaB}         = "Suchen";
$lng->{serTopic}     = "Thema";
$lng->{serRelev}     = "Relevanz";
$lng->{serPoster}    = "Schreiber";
$lng->{serPosted}    = "Datum";
$lng->{serNotFound}  = "Keine Treffer gefunden.";

# Help page
$lng->{hlpTitle}     = "Hilfe";
$lng->{hlpTxtTtl}    = "Begriffe und Funktionen";
$lng->{hlpFaqTtl}    = "H�ufig gestellte Fragen";

# Message list page
$lng->{mslTitle}     = "Private Nachrichten";
$lng->{mslSend}      = "Nachricht senden";
$lng->{mslSendTT}    = "Private Nachricht an beliebigen Empf�nger senden";
$lng->{mslDelAll}    = "Alle gelesenen l�schen";
$lng->{mslDelAllTT}  = "Alle gelesenen und gesendeten Nachrichten l�schen";
$lng->{mslInbox}     = "Eingang";
$lng->{mslOutbox}    = "Gesendet";
$lng->{mslFrom}      = "Absender";
$lng->{mslTo}        = "Empf�nger";
$lng->{mslDate}      = "Datum";
$lng->{mslCommands}  = "Aktionen";
$lng->{mslDelete}    = "L�schen";
$lng->{mslNotFound}  = "Keine privaten Nachrichten vorhanden.";
$lng->{mslExpire}    = "Private Nachrichten werden nach [[days]] Tagen gel�scht.";

# Add message page
$lng->{msaTitle}     = "Private Nachricht";
$lng->{msaSendTtl}   = "Private Nachricht senden";
$lng->{msaSendRecv}  = "Empf�nger";
$lng->{msaSendSbj}   = "Betreff";
$lng->{msaSendTxt}   = "Text";
$lng->{msaSendB}     = "Absenden";
$lng->{msaSendPrvB}  = "Vorschau";
$lng->{msaPrvTtl}    = "Vorschau";
$lng->{msaRefTtl}    = "Antwort auf Nachricht von";
$lng->{msaEmailSbj}  = "Private Nachricht";
$lng->{msaEmailTSbj} = "Betreff: ";
$lng->{msaEmailUsr}  = "Absender: ";
$lng->{msaEmailUrl}  = "Link: ";
$lng->{msaEmailT2}   = "Dies ist eine automatische Benachrichtigung der Forumssoftware.\nBitte nicht auf diese Email antworten, sondern im Forum.";

# Message page
$lng->{mssTitle}     = "Private Nachricht";
$lng->{mssDelete}    = "L�schen";
$lng->{mssDeleteTT}  = "Nachricht l�schen";
$lng->{mssReply}     = "Antworten";
$lng->{mssReplyTT}   = "Auf Nachricht antworten";
$lng->{mssQuote}     = "Zitieren";
$lng->{mssQuoteTT}   = "Auf Nachricht antworten mit Zitat";
$lng->{mssFrom}      = "Von";
$lng->{mssTo}        = "An";
$lng->{mssDate}      = "Datum";
$lng->{mssSubject}   = "Betreff";

# Blog page
$lng->{blgTitle}     = "Blog";
$lng->{blgSubject}   = "Thema";
$lng->{blgDate}      = "Datum";
$lng->{blgComment}   = "Kommentare";
$lng->{blgCommentTT} = "Kommentare anzeigen und schreiben";
$lng->{blgExpire}    = "Blog topics expire after [[days]] days.";

# Chat page
$lng->{chtTitle}     = "Chat";
$lng->{chtRefresh}   = "Aktualisieren";
$lng->{chtRefreshTT} = "Seite aktualisieren";
$lng->{chtDelAll}    = "Alle L�schen";
$lng->{chtDelAllTT}  = "Alle Nachrichten l�schen";
$lng->{chtAddTtl}    = "Nachricht schreiben";
$lng->{chtAddB}      = "Schreiben";
$lng->{chtMsgsTtl}   = "Nachrichten";

# Attachment list page
$lng->{aliTitle}     = "Dateianhangsliste";
$lng->{aliLfmTtl}    = "Listenformat";
$lng->{aliLfmSearch} = "Dateiname";
$lng->{aliLfmBoard}  = "Brett";
$lng->{aliLfmSort}   = "Sort.";
$lng->{aliLfmSrtFNm} = "Dateiname";
$lng->{aliLfmSrtUNm} = "Benutzername";
$lng->{aliLfmSrtPTm} = "Datum";
$lng->{aliLfmOrder}  = "Reihenf.";
$lng->{aliLfmOrdAsc} = "Aufst.";
$lng->{aliLfmOrdDsc} = "Abst.";
$lng->{aliLfmGall}   = "Galerie";
$lng->{aliLfmListB}  = "Auflisten";
$lng->{aliLstFile}   = "Dateiname";
$lng->{aliLstSize}   = "Gr��e";
$lng->{aliLstPost}   = "Nachricht";
$lng->{aliLstUser}   = "Benutzer";

# Email subscriptions
$lng->{subSubjBrd}   = "Abo von Brett";
$lng->{subSubjTpc}   = "Abo von Thema";
$lng->{subNoReply}   = "Dies ist eine automatische Abonnements-Email der Forumssoftware.\nBitte antworten Sie nicht auf diese Email, sondern im Forum.";
$lng->{subTopic}     = "Thema: ";
$lng->{subBy}        = "Von: ";
$lng->{subOn}        = "Datum: ";

# Feeds
$lng->{fedTitle}     = "Feeds";
$lng->{fedAllBoards} = "Alle �ffentlichen Bretter";
$lng->{fedAllBlogs}  = "Alle Blogs";

# Bounce detection
$lng->{bncWarning}   = "Warnung: Ihr Emailkonto verweigert die Annahme von Emails dieses Forums oder existiert nicht mehr. Bitte korrigieren Sie die Situation, da das Forum sonst evtl. die Zusendung von Emails an Sie einstellen muss.";

# Confirmation
$lng->{cnfTitle}     = "Best�tigung";
$lng->{cnfDelAllMsg} = "Wirklich alle gelesenen Nachrichten l�schen?";
$lng->{cnfDelAllCht} = "Wirklich alle Chat-Nachrichten l�schen?";
$lng->{cnfQuestion}  = "Wirklich";
$lng->{cnfQuestion2} = " l�schen?";
$lng->{cnfTypeUser}  = "Benutzer";
$lng->{cnfTypeGroup} = "Gruppe";
$lng->{cnfTypeCateg} = "Kategorie";
$lng->{cnfTypeBoard} = "Brett";
$lng->{cnfTypeTopic} = "Thema";
$lng->{cnfTypePoll}  = "Umfrage";
$lng->{cnfTypePost}  = "Nachricht";
$lng->{cnfTypeMsg}   = "private Nachricht";
$lng->{cnfDeleteB}   = "L�schen";

# Notification messages
$lng->{notNotify}    = "Benutzer benachrichtigen (optional Grund angeben)";
$lng->{notReason}    = "Grund:";
$lng->{notMsgAdd}    = "[[usrNam]] hat eine private <a href='[[msgUrl]]'>Nachricht</a> gesendet.";
$lng->{notPstAdd}    = "[[usrNam]] hat auf eine <a href='[[pstUrl]]'>Nachricht</a> geantwortet.";
$lng->{notPstEdt}    = "Ein Moderator hat eine <a href='[[pstUrl]]'>Nachricht</a> ge�ndert.";
$lng->{notPstDel}    = "Ein Moderator hat eine <a href='[[tpcUrl]]'>Nachricht</a> gel�scht.";
$lng->{notTpcMov}    = "Ein Moderator hat ein <a href='[[tpcUrl]]'>Thema</a> verschoben.";
$lng->{notTpcDel}    = "Ein Moderator hat ein Thema namens \"[[tpcSbj]]\" gel�scht.";
$lng->{notTpcMrg}    = "Ein Moderator hat ein Thema mit einem anderen <a href='[[tpcUrl]]'>Thema</a> zusammengelegt.";
$lng->{notEmlReg}    = "Willkommen, [[usrNam]]! Geben Sie bitte Ihre <a href='[[emlUrl]]'>Emailadresse</a> ein, um die emailbasierten Funktionen zu aktivieren.";

# Top bar messages
$lng->{msgReplyPost} = "Nachricht eingetragen";
$lng->{msgNewPost}   = "Thema eingetragen";
$lng->{msgPstChange} = "Nachricht ge�ndert";
$lng->{msgPstDel}    = "Nachricht gel�scht";
$lng->{msgPstTpcDel} = "Nachricht/Thema gel�scht";
$lng->{msgPstApprv}  = "Nachricht best�tigt";
$lng->{msgPstAttach} = "Dateianhang angef�gt";
$lng->{msgPstDetach} = "Dateianhang gel�scht";
$lng->{msgPstAttTgl} = "Einbettung umgeschaltet";
$lng->{msgOptChange} = "Optionen ge�ndert";
$lng->{msgPwdChange} = "Passwort ge�ndert";
$lng->{msgAccntReg}  = "Konto registriert";
$lng->{msgMemberAdd} = "Mitglied hinzugef�gt";
$lng->{msgMemberRem} = "Mitglied entfernt";
$lng->{msgTpcDelete} = "Thema gel�scht";
$lng->{msgTpcStik}   = "Thema fixiert";
$lng->{msgTpcUnstik} = "Thema defixiert";
$lng->{msgTpcLock}   = "Thema gesperrt";
$lng->{msgTpcUnlock} = "Thema entsperrt";
$lng->{msgTpcMove}   = "Thema verschoben";
$lng->{msgTpcMerge}  = "Themen zusammengelegt";
$lng->{msgBrnPromo}  = "Zweig bef�rdert";
$lng->{msgBrnMove}   = "Zweig verschoben";
$lng->{msgBrnDelete} = "Zweig gel�scht";
$lng->{msgPstAddTdo} = "Nachricht auf Merkliste gesetzt";
$lng->{msgPstRemTdo} = "Nachricht von Merkliste entfernt";
$lng->{msgPstAddRep} = "Beschwerde eingelegt";
$lng->{msgPstRemRep} = "Beschwerde gel�scht";
$lng->{msgMarkOld}   = "Nachrichten als alt markiert";
$lng->{msgMarkRead}  = "Nachrichten als gelesen markiert";
$lng->{msgPollAdd}   = "Umfrage hinzugef�gt";
$lng->{msgPollDel}   = "Umfrage gel�scht";
$lng->{msgPollLock}  = "Umfrage beendet";
$lng->{msgPollVote}  = "Abgestimmt";
$lng->{msgMsgAdd}    = "Private Nachricht gesendet";
$lng->{msgMsgDel}    = "Private Nachricht(en) gel�scht";
$lng->{msgChatAdd}   = "Chat-Nachricht eingetragen";
$lng->{msgChatDel}   = "Chat-Nachricht(en) gel�scht";
$lng->{msgIgnoreAdd} = "Benutzer wird ignoriert";
$lng->{msgIgnoreRem} = "Benutzer wird nicht mehr ignoriert";
$lng->{msgCfgChange} = "Forumskonfiguration ge�ndert";
$lng->{msgEolTpc}    = "Keine weiteren Themen in dieser Richtung";
$lng->{msgTksFgtPwd} = "Email zugesendet";
$lng->{msgTkaFgtPwd} = "Eingeloggt, Sie k�nnen jetzt Ihr Passwort �ndern";
$lng->{msgTkaEmlChg} = "Emailadresse ge�ndert";
$lng->{msgCronExec}  = "Cronjob ausgef�hrt";
$lng->{msgTpcTag}    = "Thema getaggt";
$lng->{msgTpcSub}    = "Thema abonniert";
$lng->{msgTpcUnsub}  = "Thema abbestellt";
$lng->{msgTpcUnsAll} = "Alle Themen abbestellt";
$lng->{msgNotesDel}  = "Benachrichtigungen entfernt";

# Error messages
$lng->{errDefault}   = "[Fehlertext fehlt]";
$lng->{errGeneric}   = "Fehler";
$lng->{errText}      = "Falls dies ein echter Fehler ist, k�nnen Sie den Administrator informieren, bitte mit genauer Fehlerbeschreibung und Fehlerzeitpunkt.";
$lng->{errUser}      = "Benutzerfehler";
$lng->{errForm}      = "Formularfehler";
$lng->{errDb}        = "Datenbankfehler";
$lng->{errEntry}     = "Datenbankeintragsfehler";
$lng->{errParam}     = "CGI Parameterfehler";
$lng->{errConfig}    = "Konfigurationsfehler";
$lng->{errMail}      = "Emailfehler";
$lng->{errNote}      = "Hinweis";
$lng->{errParamMiss} = "N�tiger Parameter fehlt.";
$lng->{errCatIdMiss} = "Kategorie-ID fehlt.";
$lng->{errBrdIdMiss} = "Brett-ID fehlt.";
$lng->{errTpcIdMiss} = "Thema-ID fehlt.";
$lng->{errUsrIdMiss} = "Benutzer-ID fehlt.";
$lng->{errGrpIdMiss} = "Gruppen-ID fehlt.";
$lng->{errPstIdMiss} = "Nachricht-ID fehlt.";
$lng->{errPrtIdMiss} = "ID der beantworteten Nachricht fehlt.";
$lng->{errMsgIdMiss} = "Message ID is missing.";
$lng->{errTPIdMiss}  = "Thema oder Nachricht-ID fehlt.";
$lng->{errCatNotFnd} = "Kategorie nicht vorhanden.";
$lng->{errBrdNotFnd} = "Brett nicht vorhanden.";
$lng->{errTpcNotFnd} = "Thema nicht vorhanden.";
$lng->{errPstNotFnd} = "Nachricht nicht vorhanden.";
$lng->{errPrtNotFnd} = "Beantwortete Nachricht nicht vorhanden.";
$lng->{errMsgNotFnd} = "Private Nachricht nicht vorhanden.";
$lng->{errUsrNotFnd} = "Benutzer nicht vorhanden.";
$lng->{errGrpNotFnd} = "Gruppe nicht vorhanden.";
$lng->{errTktNotFnd} = "Ticket nicht vorhanden. Tickets verfallen nach zwei Tagen, und nur das zuletzt zugesandte Ticket eines Typs ist g�ltig.";
$lng->{errUsrDel}    = "Benutzerkonto existiert nicht mehr.";
$lng->{errUsrFake}   = "Kein echtes Benutzerkonto.";
$lng->{errSubEmpty}  = "Betreff ist leer.";
$lng->{errBdyEmpty}  = "Nachrichtentext ist leer.";
$lng->{errNamEmpty}  = "Benutzername ist leer.";
$lng->{errPwdEmpty}  = "Passwort ist leer.";
$lng->{errEmlEmpty}  = "Emailadresse ist leer.";
$lng->{errEmlInval}  = "Emailadresse ist ung�ltig.";
$lng->{errWordEmpty} = "Suchbegriff-Feld ist leer.";
$lng->{errNamSize}   = "Benutzername ist zu kurz oder zu lang.";
$lng->{errPwdSize}   = "Passwort ist zu kurz oder zu lang.";
$lng->{errEmlSize}   = "Emailadresse ist zu kurz oder zu lang.";
$lng->{errNamChar}   = "Benutzername enth�lt ung�ltige Zeichen.";
$lng->{errPwdChar}   = "Passwort enth�lt ung�ltige Zeichen.";
$lng->{errPwdWrong}  = "Passwort ist falsch.";
$lng->{errReg}       = "Diese Funktion kann nur von einem registrierten und eingeloggten Benutzer genutzt werden.";
$lng->{errBlocked}   = "Zugriff verweigert";
$lng->{errBannedT}   = "Benutzerkonto ist gesperrt. Grund:";
$lng->{errBannedT2}  = "Dauer: ";
$lng->{errBannedT3}  = "Tage.";
$lng->{errBlockedT}  = "Ihre IP-Adresse ist auf der schwarzen Liste des Forums.";
$lng->{errBlockEmlT} = "Ihre Email-Domain ist auf der schwarzen Liste des Forums.";
$lng->{errAuthz}     = "Nicht autorisiert";
$lng->{errAdmin}     = "Sie besitzen nicht die n�tigen Zugriffsrechte.";
$lng->{errCheat}     = "Netter Versuch.";
$lng->{errSubLen}    = "Maximale Betreffl�nge �berschritten.";
$lng->{errBdyLen}    = "Maximale Nachrichtenl�nge �berschritten.";
$lng->{errReadOnly}  = "Nur Administratoren, Moderatoren und Mitglieder k�nnen in dieses Brett schreiben.";
$lng->{errModOwnPst} = "Sie k�nnen nicht Ihre eigenen Nachrichten moderieren.";
$lng->{errTpcLocked} = "Thema ist gesperrt, Sie k�nnen nicht mehr schreiben, editieren oder abstimmen.";
$lng->{errSubNoText} = "Betreff enth�lt keinen echten Text.";
$lng->{errNamGone}   = "Benutzername ist schon vergeben.";
$lng->{errEmlGone}   = "Emailadresse ist schon registriert. Es ist nur ein Konto pro Adresse erlaubt.";
$lng->{errPwdDiffer} = "Passw�rter sind nicht identisch.";
$lng->{errEmlDiffer} = "Emailadressen sind nicht identisch.";
$lng->{errDupe}      = "Nachricht ist schon eingetragen.";
$lng->{errAttName}   = "Keine Datei oder kein Dateiname angegeben.";
$lng->{errAttSize}   = "Upload fehlt, wurde abgeschnitten oder �bertrifft maximale Gr��e.";
$lng->{errAttDisab}  = "Dateianh�nge sind deaktiviert.";
$lng->{errPromoTpc}  = "Diese Nachricht ist die Basisnachricht des ganzen Themas.";
$lng->{errRollback}  = "Transaktion wurde r�ckg�ngig gemacht.";
$lng->{errPstEdtTme} = "Nachrichten k�nnen nur einen begrenzte Zeitraum nach dem Abschicken editiert werden. Dieser Zeitraum ist bereits abgelaufen.";
$lng->{errNoEmail}   = "Das Benutzerkonto hat keine Emailadresse.";
$lng->{errDontEmail} = "Das Senden von Emails f�r Ihr Konto wurde von einem Administrator deaktiviert. Typische Gr�nde daf�r sind ung�ltige Emailadressen, �berf�llte Postf�cher oder aktivierte Autoresponder.";
$lng->{errEditAppr}  = "Das Editieren von Nachrichten in moderierten Brettern ist nicht mehr erlaubt, sobald sie von einem Administrator oder Moderator best�tigt wurden.";
$lng->{errAdmUsrReg} = "Benutzerkonten k�nnen in diesem Forum nur von Administratoren registriert werden.";
$lng->{errTdoDupe}   = "Diese Nachricht ist bereits auf der Merkliste.";
$lng->{errRepOwn}    = "Eine Beschwerde �ber eine eigene Nachricht macht wenig Sinn.";
$lng->{errRepDupe}   = "Es gibt bereits eine Beschwerde �ber diese Nachricht.";
$lng->{errRepReason} = "Begr�ndung ist leer.";
$lng->{errSrcAuth}   = "Zugriffsauthentifizierung ist fehlgeschlagen. Entweder hat jemand versucht, Ihnen eine Aktion unterzuschieben (speziell falls Sie gerade von einer fremden Seite gekommen sind), oder die Authentifizierungswerte wurde nur zuf�llig gerade erneuert. In letzterem Fall bitte einfach die versuchte Aktion nochmal wiederholen.";
$lng->{errPolExist}  = "Thema hat bereits eine Umfrage.";
$lng->{errPolOneOpt} = "Eine Umfrage ben�tigt mindestens zwei Optionen.";
$lng->{errPolNoDel}  = "Nur Umfragen ohne abgegebene Stimmen k�nnen gel�scht werden.";
$lng->{errPolNoOpt}  = "Keine Option ausgew�hlt.";
$lng->{errPolNotFnd} = "Umfrage nicht vorhanden.";
$lng->{errPolLocked} = "Umfrage ist beendet.";
$lng->{errPolOpNFnd} = "Umfrageoption nicht vorhanden.";
$lng->{errPolVotedP} = "Sie k�nnen nur einmal f�r diese Umfrage abstimmen.";
$lng->{errFeatDisbl} = "Diese Funktion ist deaktiviert.";
$lng->{errAvaSizeEx} = "Maximale Dateigr��e �berschritten.";
$lng->{errAvaDimens} = "Bild muss angegebene Breite und H�he haben.";
$lng->{errAvaFmtUns} = "Dateiformat ung�ltig oder nicht unterst�tzt.";
$lng->{errAvaNoAnim} = "Animierte Bilder sind nicht erlaubt.";
$lng->{errRepostTim} = "Spamschutz aktiviert. Bitte warten Sie [[seconds]] Sekunden, bis Sie wieder eine Nachricht abschicken k�nnen.";
$lng->{errCrnEmuBsy} = "Das Forum ist zurzeit mit Wartungsarbeiten besch�ftigt. Bitte kommen Sie sp�ter wieder.";
$lng->{errForumLock} = "Das Forum ist zurzeit geschlossen. Bitte kommen Sie sp�ter wieder.";
$lng->{errMinRegTim} = "Sie m�ssen f�r mindestens [[hours]] Stunde(n) registriert sein, um diese Funktion benutzen zu k�nnen.";
$lng->{errSsnTmeout} = "Anmeldung ist abgelaufen, ung�ltig oder geh�rt jemandem anders. Sie k�nnen dieses Problem vermeiden, indem Sie dieser Website das Setzen von Cookies erlauben.";
$lng->{errDbHidden}  = "Ein Datenbankfehler ist aufgetreten und wurde geloggt.";
$lng->{errCptTmeOut} = "Anti-Spam-Bild ist abgelaufen. Sie haben [[seconds]] Sekunden Zeit, um das Formular abzuschicken.";
$lng->{errCptWrong}  = "Buchstaben vom Anti-Spam-Bild sind nicht korrekt. Bitte versuchen Sie es nochmal.";
$lng->{errCptFail}   = "Sie haben den Spambot-Test nicht bestanden.";


#------------------------------------------------------------------------------
# Help

$lng->{help} = "
<h3>Forum</h3>

<p>Als Forum wird die komplette Installation bezeichnet, die gew�hnlich
mehrere Bretter enth�lt. Man sollte das Forum immer durch den Link betreten,
der auf forum.pl (nicht forum_show.pl) endet, damit das Forum weiss, wann man
eine Session beginnt, und berechnen kann, welche Nachrichten alt und welche
neu sind.</p>

<h3>Benutzer</h3>

<p>Ein Benutzer ist jemand, der im Forum ein Konto registriert hat. Zum Lesen
ist zwar im allgemeinen kein Konto notwendig, allerdings bekommen
unregistrierte Leser keine Neu/Gelesen-Statistiken. Benutzer k�nnen Mitglied
in bestimmten Brettern werden, wodurch sie sonst unsichtbare private Bretter
sehen k�nnen und in schreibgesch�tzten Brettern schreiben k�nnen.</p>

<h3>Brett</h3>

<p>Ein Brett enth�lt Themen zu einem dem Brettnamen entsprechenden 
Themenbereich. Bretter k�nnen so eingestellt werden, so dass sie nur f�r 
registrierte Benutzer oder nur f�r Administratoren, Moderatoren und 
Brettmitglieder sichtbar sind. Bretter k�nnen anonym sein, so dass die 
Identit�t des Schreibers nicht in der Nachricht gespeichert wird (v�llige 
Anonymit�t vor Administratoren kann dies aber nicht garantieren), und k�nnen 
optional das Schreiben von Nachrichten durch unregistrierte Besucher erlauben. 
Bretter k�nnen schreibgesch�tzt sein, so dass nur Administratoren, Moderatoren 
und Mitglieder in ihnen schreiben k�nnen, sowie so eingestellt werden, dass nur 
Administratoren, Moderatoren und Mitglieder neue Themen starten k�nnen, auf 
die dann aber jeder Benutzer antworten kann. Eine weitere Option f�r Bretter 
nennt sich Best�tigungsmoderation, bei deren Aktivierung neue Nachrichten von 
Administratoren oder Moderatoren best�tigt werden m�ssen, um f�r normale 
Benutzer sichtbar zu sein. Benutzer k�nnen Bretter abonnieren, wobei sie dann 
regelm��ig die neuen Nachrichten in diesem Brett gesammelt in einer Email 
zugesandt bekommen (Haufigkeit h�ngt von der Forumskonfiguration ab).</p>

<h3>Thema</h3>

<p>Ein Thema enth�lt alle Nachrichten zu einer bestimmten Angelegenheit, die im 
Betreff angegeben sein sollte. Die Nachrichten k�nnen entweder in einer 
Baumstruktur angeordnet sein, der man entnehmen kann, welche Nachricht sich auf 
welchen Vorg�nger bezieht, oder sie k�nnen alle sequentiell hintereinander 
stehen. Bretter haben Zeiten, die angeben, wie lange es dauert, bevor ihre 
Themen gel�scht und/oder gesperrt werden. Themen k�nnen von Administratoren und 
Moderatoren auch manuell gesperrt werden, so dass man keine neue Nachrichten 
hineinschreiben kann. Benutzer k�nnen Thema abonnieren, wobei sie dann 
regelm��ig die neuen Nachrichten in diesem Thema gesammelt in einer Email 
zugesandt bekommen (Haufigkeit h�ngt von der Forumskonfiguration ab).</p>

<h3>�ffentliche Nachricht</h3>

<p>Eine Nachricht ist ein �ffentlicher Kommentar eines Benutzers zu einem 
Thema. Es kann entweder eine Nachricht mit Betreff sein, die ein neues Thema 
beginnt, oder eine Antwort zu einem existierenden Thema. Nachrichten k�nnen 
nachtr�glich editiert und gel�scht werden, was allerdings zeitlich begrenzt 
sein kann. Nachrichten k�nnen einer pers�nlichen Merkliste hinzugef�gt und im 
Falle von Regelverst��en den Administratoren und Moderatoren gemeldet 
werden.</p>

<h3>Private Nachricht</h3>

<p>Zus�tzlich zu den �ffentlichen Nachrichten k�nnen in einem Forum auch die
privaten Nachrichten aktiviert sein, die sich registrierte Benutzer
gegenseitig zuschicken k�nnen, ohne die Emailadresse des anderen zu
kennen.</p>

<h3>Administrator</h3>

<p>Ein Administrator kann alles im Forum kontrollieren und editieren. Ein
Forum kann mehrere Administratoren haben.</p>

<h3>Moderator</h3>

<p>Die Macht eines Moderators ist auf bestimmte Bretter beschr�nkt. Ein 
Moderator kann Nachrichten aller Benutzer des Brettes editieren, l�schen und 
best�tigen, Themen l�schen und sperren, Brettmitglieder hinzuf�gen und 
entfernen sowie die Beschwerdeliste einsehen. Ein Brett kann mehrere 
Moderatoren haben.</p>

<h3>Umfragen</h3>

<p>Der Besitzer eines Themas kann diesem eine Umfrage hinzuf�gen. Jede Umfrage
kann bis zu 20 Optionen enthalten. Registrierte Benutzer k�nnen pro Umfrage
eine Stimme f�r eine einzelne Option abgeben. Umfragen k�nnen nicht editiert
werden, und k�nnen nur so lange wieder gel�scht werden, wie noch keine Stimme
abgegeben wurde.</p>

<h3>Icons</h3>

<table>
<tr><td>
<img src='[[dataPath]]/post_nu.png' alt='N/U'/>
<img src='[[dataPath]]/topic_nu.png' alt='N/U'/>
<img src='[[dataPath]]/board_nu.png' alt='N/U'/>
</td><td>
Gelbe Icons zeigen neue Nachrichten bzw. Themen oder Bretter mit neuen
Nachrichten an. In diesem Forum bedeutet neu, dass eine Nachricht seit dem
letzten Besuch hinzugekommen ist. Auch wenn eine Nachricht gerade gelesen
wurde, gilt sie immer noch als neu, und wird erst beim n�chsten Besuch als alt
gewertet.
</td></tr>
<tr><td>
<img src='[[dataPath]]/post_or.png' alt='O/R'/>
<img src='[[dataPath]]/topic_or.png' alt='O/R'/>
<img src='[[dataPath]]/board_or.png' alt='O/R'/>
</td><td>
Abgehakte Icons bedeuten, dass eine Nachricht bzw. alle Nachrichten in einem
Thema oder Brett gelesen wurden. Als gelesen werden alle Nachrichten gewertet,
die einmal anzeigt wurden oder �lter als eine bestimmte Anzahl von Tagen
sind. Da neu/alt und ungelesen/gelesen in diesem Forum unabh�ngige Konzepte
sind, k�nnen Nachrichten auch gleichzeitig neu und gelesen sowie alt und
ungelesen sein.
</td></tr>
<tr><td>
<img src='[[dataPath]]/post_i.png' alt='I'/>
</td><td>
Die jeweilige Nachricht bzw. das Thema sind f�r andere Benutzer 
unsichtbar sind, da sie noch auf Best�tigung durch einen Administrator 
oder Moderator warten.
</td></tr>
<tr><td>
<img src='[[dataPath]]/topic_l.png' alt='L'/>
</td><td>
Das Schloss-Icon bedeutet, dass das entsprechende Thema gesperrt ist, und au�er
Administratoren und Moderatoren niemand mehr neue Antworten schreiben kann.
</td></tr>
</table>

<h3>Formatierungs-Tags</h3>

<p>Aus Sicherheitsgr�nden unterst�tzt mwForum nur seine eigenen 
Formatierungs-Tags, kein HTML. Verf�gbare Tags:</p>

<table>
<tr><td>[b]Text[/b]</td>
<td>zeigt Text <b>fett</b> an</td></tr>
<tr><td>[i]Text[/i]</td>
<td>zeigt Text <i>kursiv</i> an</td></tr>
<tr><td>[tt]Text[/tt]</td>
<td>zeigt Text <tt>nichtproportional</tt> an</td></tr>
<tr><td>[img]Adresse[/img]</td>
<td>bettet ein Bild ein (wenn die Funktion aktiviert ist)</td></tr>
<tr><td>[url]Adresse[/url]</td>
<td>macht die Adresse zu einem Link</td></tr>
<tr><td>[url=Adresse]Text[/url]</td>
<td>macht Text zu einem Link f�r die Adresse</td></tr>
</table>

<h3>Smileys</h3>

<p>Die folgenden Emoticons werden als Bilder dargestellt (wenn die
entsprechende Funktion aktiviert ist): :-) :-D ;-) :-( :-o :-P</p>

";

#------------------------------------------------------------------------------
# FAQ

$lng->{faq} = "

<h3>Ich habe mein Passwort verloren, k�nnen Sie mir das zuschicken?</h3>

<p>Nein, das originale Passwort wird aus Sicherheitsgr�nden nirgendwo 
gespeichert. Auf der Anmeldeseite k�nnen Sie jedoch eine Email mit einer 
speziellen Anmelde-URL anfordern, die eine begrenzte Zeit g�ltig ist, und mit 
der Sie wieder einloggen k�nnen. Danach k�nnen Sie dann das Passwort 
�ndern.</p>

<h3>Warum diese umst�ndliche Registrierung per Passwortzusendung?</h3>

<p>Dieses Forum hat diverse Funktionen, die dem Benutzer Emails zusenden 
k�nnen, z.B. Antwortbenachrichtigungen und Brettabonnements. Das Forum 
verlangt die Angabe einer g�ltigen Emailadresse und sendet das n�tige Passwort 
nur an diese Adresse, um damit die G�ltigkeit der Adresse sicherzustellen. 
Damit wird verhindert, dass Benutzer falsche oder inkorrekte Adressen angeben, 
und dann aber trotzdem die Emailfunktionen benutzen, was zu massenhaft 
fehlgeleiteten Emails und Fehlermeldungen f�r die Administratoren f�hren 
w�rde. Au�erdem fungiert das Registrierungsverfahren auch als 
\"doppelte Opt-In\"-L�sung, die verhindert, dass das Forum zum Email-Spammen
anderer Leute mi�braucht werden kann.</p>

<h3>Wann muss man sich abmelden?</h3>

<p>Man braucht sich nur abzumelden, wenn der benutzte Computer auch von nicht
vertrauensw�rdigen Personen benutzt wird. Wie oben geschrieben werden
Benutzer-ID und Passwort per Cookie auf dem Computer gespeichert. Diese werden
beim Abmelden entfernt, so dass sie nicht von einer anderen Person missbraucht
werden k�nnen.</p>

<h3>Wie kann man Bilder und andere Dateien an Nachrichten anh�ngen?</h3>

<p>Wenn Dateianh�nge in diesem Forum aktiviert sind, muss man zuerst 
ganz normal eine �ffentliche Nachricht abschicken. Danach kann man den 
Anh�ngen-Knopf der Nachricht benutzen und so zur Dateianhangs-Seite 
gelangen. Das Schreiben einer Nachricht und das Hochladen sind auf 
diese Weise getrennt, da das Hochladen aus verschiedenen Gr�nden 
fehlschlagen kann, und es nicht gut w�re, wenn dabei der normale 
Nachrichtentext verlorenginge.</p>

";

#------------------------------------------------------------------------------

# Load local string overrides
do 'MwfGermanLocal.pm';

#------------------------------------------------------------------------------
# Return OK
1;
